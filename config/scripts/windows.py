import subprocess
import re

"""
hyprland & rofi alt-tab alternative
"""


def parse_window_info(text: str) -> dict:
    """
    Parse window information from the given text.

    Parameters:
    - text (str): Text containing window information.

    Returns:
    - dict: Dictionary containing parsed window information.
    """
    window_info = {}

    lines = text.split('\n')
    for line in lines:
        if not line.strip():
            continue

        if '->' in line:
            window_id = line.split('->')[1].strip()
            window_info['window_id'] = window_id[:-1]
        else:
            match = re.match(r'\s*([^:]+)\s*:\s*(.+)\s*', line)
            if match:
                key, value = match.groups()
                window_info[key] = value

    return window_info


def extract_workspace(text: str) -> str:
    """
    Extract workspace information from the given text.

    "-98 dd(special:magic)" -> "special:magic"

    Parameters:
    - text (str): Text containing workspace information

    Returns:
    - str: Extracted workspace information.
    """
    match = re.search(r'\((.*?)\)', text)

    if match:
        return match.group(1)
    else:
        return text


def window_info(output: str) -> list:
    """
    Extract and organize window information from the given output.

    Parameters:
    - output (str): Output containing window information.

    Returns:
    - list: List of dictionaries containing parsed window information.
    """
    windows = output.split("\n\n")

    windows = [parse_window_info(window)
               for window in windows if window.startswith("Window")]

    windows = [window for window in windows if window["window_id"]
               is not None and window["window_id"].strip()]

    result = []

    for window in windows:
        info = {}

        class_name = window["initialTitle"]
        title = window["title"]

        info["pid"] = window["pid"]
        info["title"] = class_name + " " + title
        info["workspace"] = extract_workspace(window["workspace"])

        result.append(info)

    return result


get_workspace_command = [
    "hyprctl", "activewindow", "|",
    "grep", "\"workspace: \"", "|",
    "cut", "-d", "' '", "-f3"
]


def run_command(command: str) -> str:
    """
    Run a command in the shell and return the output.

    Parameters:
    - command (str): The command to be executed.

    Returns:
    - str: The output of the command.
    """
    process = subprocess.Popen(
        command, shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE, text=True
    )

    output, error = process.communicate()

    if process.returncode != 0:
        print(
            f"Command failed with non-zero return code: {process.returncode}")
        print(f"Error message: {error.strip()}")
        exit(1)

    return output.strip()


def get_rofi_selection() -> dict:
    """
    Get user selection using rofi for window switching.

    Returns:
    - dict: Dictionary containing information about the selected window.
    """
    clients_output = subprocess.check_output(
        ["hyprctl", "clients"]).decode("utf-8")

    window_classes = window_info(clients_output)

    windows = [win["title"] for win in window_classes]

    if not window_classes:
        exit()

    rofi_process = subprocess.Popen(
        ["rofi", "-dmenu", "-format", "i"],
        stdin=subprocess.PIPE, stdout=subprocess.PIPE
    )

    selected_window, _ = rofi_process.communicate(
        "\n".join(windows).encode("utf-8"))

    selected_window = selected_window.decode("utf-8").strip()

    selected_info = window_classes[int(selected_window)]

    if not selected_window:
        # show error with notification manager
        exit()

    return selected_info


def main():
    """
    Main function for managing window and workspace switching.
    """
    selected_info = get_rofi_selection()

    get_workspace_command = """
    hyprctl activewindow | grep 'workspace: ' | cut -d ' ' -f3
    """

    current_workspace = run_command(get_workspace_command)

    # skip workspace change if equals to current
    if extract_workspace(current_workspace) != selected_info["workspace"]:
        workspace_command = f"""
        hyprctl dispatch workspace {selected_info['workspace']}
        """
        run_command(workspace_command)

    # focus application only if workspace default
    if selected_info["workspace"].isnumeric():
        focus_window_command = f"""
        hyprctl dispatch focuswindow pid:{selected_info['pid']}
        """
        run_command(focus_window_command)


if __name__ == "__main__":
    main()
