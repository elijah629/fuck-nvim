# fuck-neovim

when all you use neovim for is configuring neovim...  
and then you use vscode again...  
**this is for you**

## Welcome to the light side

fuck-neovim tries to mimic a the *vscode experience* with some familiar keybindings for beginners to vim. ( No, you still have to learn vim )  
VSCode feels lightweight... but fuck it is not. Ever got hangs? Yea, that's electron being slow.  
<!-- please update this plugin count future me -->
fuck-neovim is **truly lightweight**. Only `11` plugins or.

## Changes from VSCode keybinds

**Ctrl+Shift+`** is **Ctrl-T**

You are also free to modify anything in the [lua/config](./lua/config/) folder. Customize the core plugins in [lua/core/plugins.lua](./lua/core/plugins.lua)

## Install

**I reccomend backing up!**

```sh
# Config
mv ~/.config/nvim{,.bak}

# Data
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

```sh
git clone https://github.com/elijah629/fuck-nvim ~/.config/nvim
```
