# My dotfiles with hyprland, waybar and neovim

## Install

### Automatic

Run `install.sh`

```bash 
chmod +x ./install.sh
./install.sh
```

### Manual (AUR)

#### Clone repo and install dependencies

```
git clone https://github.com/farneser/dotfiles
```

For semi-automated installing allow scripts

```bash
chmod +x ./scripts/*.sh
```

Install dependencies:

- neovim (version >= 0.8) - text editor
- kitty - terminal emulator
- waybar - tray
- rofi - applications menu
- swappy - screenshots
- hyprland - wayland tilemanager
- cava - audion visualisation
- wl-clipboard - wayland clipboard utils

or run (yay required)

```
./scripts/install-deps-aur.sh
```

#### Setup configuration

move `config` folder content to `~/.config`

```bash
cp -r ./config/* ~/.config/
```

or run `./scripts/install-config.sh`

```bash
./scripts/install-config.sh
```

##### On laptop

run `./scripts/logind-power-buttons.sh` for suspend on power button instead shutdown and hold for shutdown

```bash
sudo ./scripts/logind-power-buttons.sh
```
