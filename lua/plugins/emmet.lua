return {
	"mattn/emmet-vim",
	ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
	config = function()
		vim.g.user_emmet_leader_key = "<C-Z>" -- leaderkey for emmet ctrl+Z
	end,
}
