require("mason").setup({
	ui = {
		icons = {
			package_installed = " ",
			package_pending = " ",
			package_uninstalled = " ",
		},
	},
	ensured_installed = { "pip" }, -- for python
})
