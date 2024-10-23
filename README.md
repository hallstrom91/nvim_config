# Neovim Config -

## Requirements

- **Neovim**: v0.10.1 or later

# Install

1. **Clone Repository**:

- Linux:

```bash linux
git clone https://github.com/hallstrom91/nvim_config.git ~/.config/nvim
```

- Windows:

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

# Plugins

- in the folder /config, there is specific config files for some plugins but not all.
- **This configuration includes the following plugins:**
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Comment](https://github.com/numToStr/Comment.nvim)
- [Conform](https://github.com/stevearc/conform.nvim)
- [Emmet-vim](https://github.com/mattn/emmet-vim)
- [Vim-Fugitive](https://github.com/tpope/vim-fugitive)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Indent-Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [Mason-Lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Neo-Tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Folke](https://github.com/folke/noice.nvim)
- [Nvim-Autopairs](https://github.com/windwp/nvim-autopairs)
- [Nvim-bqf](https://github.com/kevinhwang91/nvim-bqf)
- [Nvim-Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Nvim-Colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [Nvim-Lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Nvim-Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Nvim-Treesitter-Context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [Nvim-Ufo](https://github.com/kevinhwang91/nvim-ufo)
- [Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [Prettier](https://github.com/MunifTanjim/prettier.nvim)
- [Promise-Async](https://github.com/kevinhwang91/promise-async)
- [Render-Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [Tailwindcss-Colorizer-cmp](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim)
- [Nvim-Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Arctic](https://github.com/rockyzhang24/arctic.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Which-key](https://github.com/folke/which-key.nvim)

## Plugin Notes

- Mason will install needed LSP servers.
- Formatters and Linters needs to be installed manual. Inside nvim run command `:Mason`.
- Recommend Formatters is `Prettier`, `Black`, `isort` and `stylua`.
- Recommended Linter is `quick-lint-js`.

# Keybindings Summary

## Leader Key

- Leader Key: `Space`
- Local Leader Key: `\`

## Command Mode

- Enter CMD line: `;` & `:`

## Insert Mode

- Exit Insert Mode: `jk`

## Clipboard Operations

- Copy (works in all modes): `Ctrl + c`
- Paste: `Ctrl + v`
- Save: `Ctrl + s`

## Text Navigation

- Move Line Up: `Alt + Arrowkey UP`
- Move Line Down: `Alt + Arrowkey DOWN`

## Undo

- Undo: `Ctrl + z`

## Backspace

- Delete Character (Insert Mode): `Backspace`
- Delete Selected Text (Visual Mode): `Backspace`

## Text Selection

- Select Text (Normal, Visual, Insert): `Shift + Arrow Keys`
- Select ALL text: `Ctrl + a`

## Plugin Binds

- Toggle Neo-Tree File Explorer: `Ctrl + n`
- Toggle Neo-tree to show buffers: `Space + b`
- Show Git Status in Neo-Tree: `Space + s`
