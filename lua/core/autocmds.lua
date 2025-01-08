-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*", "*.md" },
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- open help window in vertical mode
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- auto update plugins at start

-- local function augroup(name)
-- 	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
--
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	group = augroup("autoupdate"),
-- 	callback = function()
-- 		vim.defer_fn(function()
-- 			if require("lazy.status").has_updates() then
-- 				require("lazy").update({ show = false })
-- 			end
-- 		end, 1000)
-- 	end,
-- })

-- Auto update Treesitter Parsers
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "VeryLazy",
	callback = function()
		vim.cmd("TSUpdate")
	end,
})
