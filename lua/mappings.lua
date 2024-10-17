local map = vim.keymap.set

------------------------
--- Keybinds
------------------------

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Default nvim keybinds
map("n", ";", ":", { desc = "CMD enter command mode" }) -- open cmd mode with ;
map("i", "jk", "<ESC>") -- leave instert mode with "jk"
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>") -- save with ctrl+s in all modes
map({ "n", "v", "i" }, "<C-c>", '"+y', { noremap = true, silent = true }) -- Copy with ctrl+c in all modes
-- map({ "n", "v", "i" }, "<C-v>", '"+p', { noremap = true, silent = true }) -- Paste with ctrl+v in normal, visual, and insert modes

-- Paste in Normal mode
map("n", "<C-v>", '"+p', { noremap = true, silent = true })
-- Paste in Visual mode (replace selected text with clipboard content)
map("v", "<C-v>", '"+p', { noremap = true, silent = true })
-- Paste in Insert mode
map("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

----- Move row UP  with Alt+Up-arrowkey
map("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move row DOWN with Alt+Down-arrowkey
map("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Copy to sysclipboard with Ctrl + C in visual mode
--map("v", "<C-c>", '"+y', { noremap = true, silent = true })
-- Paste from sysclipboard with Ctrl + V in insert mode
--map("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
-- paste from sysclipboard with Ctrl + V in normal mode
--map("n", "<C-v>", '"+p', { noremap = true, silent = true })
-- Paste from sysclipboard with Ctrl + V in visual mode
--map("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- Regret with Ctrl + Z
map("n", "<C-z>", "u", { noremap = true, silent = true })
map("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })

-- remove with backspace key
--map("v", "<BS>", '"_d', { noremap = true, silent = true })
--map("i", "<BS>", '<C-o>"_d', { noremap = true, silent = true })

-- Allow backspace in Insert mode
map("i", "<BS>", "<BS>", { noremap = true, silent = true })
-- Allow backspace in Visual mode (delete selected text)
map("v", "<BS>", '"_d', { noremap = true, silent = true })

-- Shift + Arrow keys for text selection in normal mode
map("n", "<S-Left>", "v<Left>", { noremap = true, silent = true })
map("n", "<S-Right>", "v<Right>", { noremap = true, silent = true })
map("n", "<S-Up>", "v<Up>", { noremap = true, silent = true })
map("n", "<S-Down>", "v<Down>", { noremap = true, silent = true })

-- Shift + Arrow keys for text selection in visual mode
map("v", "<S-Left>", "<Left>", { noremap = true, silent = true })
map("v", "<S-Right>", "<Right>", { noremap = true, silent = true })
map("v", "<S-Up>", "<Up>", { noremap = true, silent = true })
map("v", "<S-Down>", "<Down>", { noremap = true, silent = true })

-- Shift + Arrow keys for text selection in insert mode
map("i", "<S-Left>", "<C-o>v<Left>", { noremap = true, silent = true })
map("i", "<S-Right>", "<C-o>v<Right>", { noremap = true, silent = true })
map("i", "<S-Up>", "<C-o>v<Up>", { noremap = true, silent = true })
map("i", "<S-Down>", "<C-o>v<Down>", { noremap = true, silent = true })

------------------------
--- Plugin binds
------------------------

-- Telescope binds
map("n", "<leader>pd", ":Telescope diagnostics<CR>", { noremap = true, silent = true }) -- space + d: Show diagnostics

-- Neo-tree binds
map("n", "<C-n>", ":Neotree toggle position=right reveal_force_cwd=true<CR>", { noremap = true, silent = true }) -- Ctrl + n: Toggle Neo-tree file explorer
map("n", "<leader>b", ":Neotree toggle show buffers right<CR>", { noremap = true, silent = true }) -- space + b: Toggle Neo-tree to show buffers on the right
map("n", "<leader>s", ":Neotree float git_status<CR>", { noremap = true, silent = true }) -- space + s: Show git status in Neo-tree
