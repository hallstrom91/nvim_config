local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- open cmd mode with ;
map("n", ";", ":", { desc = "CMD enter command mode" })
-- leave instert mode with "jk"
map("i", "jk", "<ESC>")
-- Copy with ctrl+c in all modes
map({ "n", "v", "i" }, "<C-c>", '"+y', opts)

-- Save with Ctrl + S and exit insert mode
map("n", "<C-s>", "<cmd> w <cr>", opts)
map("i", "<C-s>", "<cmd> w <cr><cmd> stopinsert <cr>", opts)
map("v", "<C-s>", "<cmd> w <cr><cmd> stopinsert <cr>", opts)

-- Paste in Normal mode
map("n", "<C-v>", '"+p', opts)
-- Paste in Visual mode (replace selected text with clipboard content)
map("v", "<C-v>", '"+p', opts)
-- Paste in Insert mode
map("i", "<C-v>", "<C-r>+", opts)

----- Move row UP  with Alt+Up-arrowkey
map("n", "<A-Up>", ":m .-2<CR>==", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- Move row DOWN with Alt+Down-arrowkey
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

-- Regret with Ctrl + Z
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<C-o>u", opts)

-- Allow backspace in Insert mode
map("i", "<BS>", "<BS>", opts)
-- Allow backspace in Visual mode (delete selected text)
map("v", "<BS>", '"_d', opts)

-- Shift + Arrow keys for text selection in normal mode
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)
map("n", "<S-Up>", "v<Up>", opts)
map("n", "<S-Down>", "v<Down>", opts)

-- Shift + Arrow keys for text selection in visual mode
map("v", "<S-Left>", "<Left>", opts)
map("v", "<S-Right>", "<Right>", opts)
map("v", "<S-Up>", "<Up>", opts)
map("v", "<S-Down>", "<Down>", opts)

-- Shift + Arrow keys for text selection in insert mode
map("i", "<S-Left>", "<C-o>v<Left>", opts)
map("i", "<S-Right>", "<C-o>v<Right>", opts)
map("i", "<S-Up>", "<C-o>v<Up>", opts)
map("i", "<S-Down>", "<C-o>v<Down>", opts)

-- Mark all text in a file with ctrl+a. Insert, Normal and Visual.
map("n", "<C-a>", "ggVG", opts)
map("i", "<C-a>", "<Esc>ggVG", opts)
map("v", "<C-a>", "ggVG", opts)

------------------------
--- Plugin binds
------------------------

-- Ctrl + n: Toggle Neo-tree file explorer
map("n", "<C-n>", ":Neotree toggle position=right reveal_force_cwd=true<CR>", opts)
-- space + b: Toggle Neo-tree to show buffers on the right
map("n", "<leader>b", ":Neotree toggle show buffers right<CR>", opts)
-- space + s: Show git status in Neo-tree
map("n", "<leader>s", ":Neotree float git_status<CR>", opts)
