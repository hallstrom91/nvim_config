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

local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("autoupdate"),
	callback = function()
		vim.defer_fn(function()
			if require("lazy.status").has_updates() then
				require("lazy").update({ show = false })
			end
		end, 1000) -- 1000 ms delay at startup
	end,
})

-- Spell checker
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "javascript" },
-- 	callback = function()
-- 		vim.opt_local.spell = true
-- 		vim.opt_local.spellang = "en_us"
-- 		vim.opt_local.spelloptions = "camel"
-- 		vim.opt_local.spellcapcheck = ""
-- 	end,
-- })
