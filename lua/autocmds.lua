------------------------
-- Format on save
------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

------------------------
-- open in vertical mode
------------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})
