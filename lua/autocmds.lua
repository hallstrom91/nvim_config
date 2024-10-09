-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- open :h -docs in vertical window
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L", -- Flyttar hjälpfönstret till höger som vertikal split
})
