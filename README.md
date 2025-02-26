## How to install this config
- Clone the project in ~/.config/nvim folder.

This is a C++ oriented neovim config which uses clang to analyse your code and LLDB to debug it. Thus, make sure that these tools are installed on your system.

## Requirements
- Neovim 0.10+
- The following packages (please adapt to your distribution):
```bash
sudo pacman -S clang lldb cmake make
```

You can also use Mason to install the first two tools.
- Some formatters are used in this config, please check `~/.config/nvim/lua/aotrix/plugins/autoformat.lua` and install or remove the ones you need.

## Notes
In order to toggle transparency, execute this command in neovim:
```
:TransparentToggle
```
