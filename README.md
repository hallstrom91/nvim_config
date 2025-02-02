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

## Plugin Notes

- Mason will install needed LSP servers.
- Formatters and Linters needs to be installed manual. Inside nvim run command `:Mason`.
- Recommend Formatters is `Prettier`, `Black`, `isort` and `stylua`.
- Recommended Linter is `quick-lint-js`.

# Keybindings Summary

### Leader Key

- Leader Key: `Space`
- Local Leader Key: `\`

### Command Mode

- Enter CMD line: `;` & `:`

### All other keybinds

- View more bindings by pressing `space`, shows all keybinds.
- or use binded key like: `g`, `c`, `z` or in cmdline `WhichKey`

## Plugin Health

- Open information about plugins etc: `checkhealth`

## Commands for LSP

- Stop specific Lsp : `LspStop servername`
- Start specific Lsp: `LspStart servername`

# Use Tailwindcss LSP or css_variables LSP

- If you want to use Tailwind LSP: `LspStart tailwindcss`
- If you want to use css_variables LSP: `LspStart css_variables`
