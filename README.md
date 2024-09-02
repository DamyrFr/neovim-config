# 🚀 My Awesome Neovim Configuration

<a href="https://dotfyle.com/DamyrFr/neovim-config"><img src="https://dotfyle.com/DamyrFr/neovim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/DamyrFr/neovim-config"><img src="https://dotfyle.com/DamyrFr/neovim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/DamyrFr/neovim-config"><img src="https://dotfyle.com/DamyrFr/neovim-config/badges/plugin-manager?style=flat" /></a>

Welcome to my Neovim configuration repository! This setup is designed to provide a powerful and efficient editing experience using Neovim, with a focus on modularity and ease of use. This configuration is used by [DamyrFr/ansible-personal-computer](https://github.com/DamyrFr/ansible-personal-computer).

## 📸 Screenshot

![View on gofile](./img/exemple.png)

## 🌟 Features

- **Plugin Management**: Utilizes [lazy.nvim](https://github.com/folke/lazy.nvim) for efficient and lazy-loaded plugin management.
- **LSP Support**: Incorporates [Mason](https://github.com/williamboman/mason.nvim) for easy Language Server Protocol (LSP) installation and management.
- **Modular Structure**: The configuration is split into three main parts for better organization and maintainability:
  - `plugins`: Defines and installs plugins using lazy.nvim
  - `settings`: Contains all Neovim and plugin-specific settings
  - `lsp`: Configures LSP setup and related settings

## 🛠️ Installation

1. Ensure you have Neovim 0.7+ installed.
2. Back up your existing Neovim configuration if you have one.
3. Clone this repository: `git clone https://github.com/yourusername/neovim-config.git ~/.config/nvim`
4. Launch Neovim and let lazy.nvim install the plugins: `nvim`

## 📁 Structure

```
.
├── init.lua
├── lua
│   ├── plugins.lua
│   ├── settings.lua
│   └── lsp.lua
└── README.md
```

## 🔧 Plugins

### colorscheme

+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### file-explorer

+ [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [f-person/git-blame.nvim](https://dotfyle.com/plugins/f-person/git-blame.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [shellRaining/hlchunk.nvim](https://dotfyle.com/plugins/shellRaining/hlchunk.nvim)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### statusline

+ [sontungexpt/sttusline](https://dotfyle.com/plugins/sontungexpt/sttusline)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### yaml

+ [someone-stole-my-name/yaml-companion.nvim](https://dotfyle.com/plugins/someone-stole-my-name/yaml-companion.nvim)

This readme was generated (partially) by [Dotfyle](https://dotfyle.com)
