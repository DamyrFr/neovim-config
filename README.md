# Config file for my Neovim config

This is my IDE configuration, this is part of my global personnal computer configuration available on this repository : [DamyrFr/ansible-personal-computer](https://github.com/DamyrFr/ansible-personal-computer).

If you have any questions or comments, feel free to contact me.

## Organization

The split code is divided into 3 files.
* plugins.lua to install the various addons
* settings.lua for the general parameters
* lsp.lua for configuring the LSPs

## Addons managment

### Global package

By default I use now [Lazy package manager](https://github.com/folke/lazy.nvim).

WARNING: The old package manager, `Plug` is not supported anymore !

### LSP install

Now I use a addon to install and update LSPs on Neovim, this addon is [Mason](https://github.com/williamboman/mason.nvim).
