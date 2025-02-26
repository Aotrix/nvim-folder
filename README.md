## How to install this config
- Clone the project in ~/.config/nvim folder.

This is a C++ intended neovim config which uses clang to analyse your code and LLDB to debug it. Thus, make sure that these tools installed on your system.

On Arch based systems:
```bash
sudo pacman -S clang
sudo pacman -S lldb
```

You can also use Mason to install these tools.
- Some formatters are used in this config, please check `~/.config/nvim/lua/aotrix/plugins/autoformat.lua` and install or remove the ones you need.
