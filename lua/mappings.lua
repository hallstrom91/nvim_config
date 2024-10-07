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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>") -- save with ctrl+s in all modes

----- Move row UP  with Alt+Up-arrowkey
map("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move row DOWN with Alt+Down-arrowkey
map("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Copy to sysclipboard with Ctrl + C in visual mode
map("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Paste from sysclipboard with Ctrl + V in insert mode
map("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })

-- paste from sysclipboard with Ctrl + V in normal mode
map("n", "<C-v>", '"+p', { noremap = true, silent = true })

-- Paste from sysclipboard with Ctrl + V in visual mode
map("v", "<C-v>", '"+p', { noremap = true, silent = true })

-- Regret with Ctrl + Z
map("n", "<C-z>", "u", { noremap = true, silent = true })
map("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })

-- remove with backspace key
map("v", "<BS>", '"_d', { noremap = true, silent = true })

-- Shift + Arrow keys for text selection
map("n", "<S-Left>", "v<Left>", { noremap = true, silent = true })
map("n", "<S-Right>", "v<Right>", { noremap = true, silent = true })
map("n", "<S-Up>", "v<Up>", { noremap = true, silent = true })
map("n", "<S-Down>", "v<Down>", { noremap = true, silent = true })
map("v", "<S-Left>", "<Left>", { noremap = true, silent = true })
map("v", "<S-Right>", "<Right>", { noremap = true, silent = true })
map("v", "<S-Up>", "<Up>", { noremap = true, silent = true })
map("v", "<S-Down>", "<Down>", { noremap = true, silent = true }) 

-- Save the current buffer in Insert mode
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true }) -- ctrl + s

-- Save the current buffer in Visual mode
map("v", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true }) -- ctrl + s

------------------------
--- Plugin binds
------------------------

-- Telescope binds
-- map("n", "<leader>pd", ":Telescope diagnostics<CR>", { noremap = true, silent = true }) -- space + d: Show diagnostics

-- Bufferline binds -- Go to visible buffers with Ctrl + number
map("n", "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
map("n", "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
map("n", "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
map("n", "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
map("n", "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
map("n", "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
map("n", "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
map("n", "<C-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
map("n", "<C-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
map("n", "<C-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", { noremap = true, silent = true }) -- Go to last visible buffer


-- Neo-tree binds
map("n", "<C-n>", ":Neotree toggle position=right reveal_force_cwd=true<CR>", { noremap = true, silent = true }) -- Ctrl + n: Toggle Neo-tree file explorer 
map("n", "<leader>b", ":Neotree toggle show buffers right<CR>", { noremap = true, silent = true }) -- space + b: Toggle Neo-tree to show buffers on the right
map("n", "<leader>s", ":Neotree float git_status<CR>", { noremap = true, silent = true }) -- space + s: Show git status in Neo-tree
