# Neovim Config

## Requirements
- **Neovim**: v0.10.1 or later

## Install

1. **Clone Repository**:

- Linux:
```bash linux
git clone https://github.com/hallstrom91/nvim_config.git ~/.config/nvim
```
-  Windows:
```bash windows
git clone https://github.com/hallstrom91/nvim_config.git C:\Users\<YOUR_USERNAME>\AppData\Local\nvim
```

2. **Install Nerd Fonts**:
   
Install Nerd Fonts: I recommend installing Nerd Fonts (non-Mono versions) for optimal icon support. You can download it from the following link: [Nerd Fonts Download](https://www.nerdfonts.com/font-downloads)

3. **Install Fonts**:

- Linux:
Download the font files and extract them.
Move them to your font directory (usually ~/.fonts or /usr/share/fonts).

- Update the font cache:
```bash linux
fc-cache -fv
```

- Windows:
Download the font files and extract them.
Right-click on the .ttf or .otf files and select "Install."

## Plugins & Configs
Plugins and Configurations
This configuration includes the following plugins:

**lua/config/**
* conform.lua
* mason.lua
* nvim-colorizer.lua
* tailwindcss-colorizer-cmp.lua
* lazy.lua
* neo-tree.lua
* nvim-lspconfig.lua
* luasnip.lua
* noice.lua
* nvim-treesitter.lua
* mason-lspconfig.lua
* nvim-cmp.lua
* prettier.lua

**lua/plugins/**
* bufferline.lua
* mason-lspconfig.lua
* nvim-colorizer.lua
* tailwindcss-colorizer-cmp.lua
* conform.lua
* mason.lua
* nvim-lspconfig.lua
* theme-gruvbox.lua
* emmet.lua
* neo-tree.lua
* nvim-treesitter-context.lua
* theme-vsc-modern.lua
* gitsigns.lua
* noice.lua
* nvim-treesitter.lua
* lualine.lua
* nvim-autopairs.lua
* nvim-web-devicons.lua
* luasnip.lua
* nvim-cmp.lua
* prettier.lua
