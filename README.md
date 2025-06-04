## Neovim Configuration Files
Just my humble configuration for Neovim dev environment. Got some good stuff from the primeagen, switched to native LSP usage, managed my own plugins (don't get me wrong, Kikstart.nvim is good and all but upgrades broke my setup).
### Contents
```
.
├── after # Individual plugins configuration
│   └── plugin # Configuration for each plugin
├── init.lua # Main config file, mainly imports my personal config
├── lazy-lock.json # Got to learn what is this
├── lsp # LSP folder containing basic config for them as Nvim 0.11
└── lua # Personal configuration Path
    └── kuroashi # Main personal profile
        ├── autocmds.lua # Autocommands config
        ├── init.lua # General editor configurations
        ├── lazy.lua # Lazy package manager configuration
        ├── lsp-init.lua # LSP initialization
        ├── plugins # Plugins Folder
        └── remap.lua # Key remaps
```
