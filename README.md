# NeoVim configuration

Here is my NeoVim config 

NeoVim requires version >=0.8. Config use LazyLoader for plugins

## Installation on Linux/MacOS

* Save your config

    ```bash
    mv ~/.config/nvim{,.bak}
    ```

* Clone config
    
    ```bash
    git clone https://github.com/farneser/nvim-config ~/.config/nvim
    ```

* Remove `.git` folder

    ```bash
    rm -rf ~/.config/nvim/.git
    ```

## Mappings

Leader is a `SPACE`

| Key          | Description          |
|--------------|----------------------|
| `<leader>e`  | Focus on NeoTree     |
| `<leader>E`  | Toggle NeoTree       |
| `<leader>fg` | Find by file content |
| `<C-p>`      | Find file            |
| `<leader>fb` | Open buffers                |
| `K`          | Element docs                |
| `gd`         | Go to definition            | 
| `<leader>ca` | Code actions                | 
| `<leader>cd` | Make file directory as root |
## Languages spell checking 

todo: complete list
