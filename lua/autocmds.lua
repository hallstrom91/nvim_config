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

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		require("lazy").sync({
-- 			show = false,
-- 		})
-- 	end,
-- })
