return {
	{

		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "BufWinEnter",
		config = function()
			require("config.bufferline")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-web-devicons" },
		event = "BufWinEnter", -- Test
		config = function()
			require("config.lualine")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" }, -- test
		config = function()
			require("config.indent-blankline")
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		ft = { "css", "scss", "html", "javascript", "typescript" },
		config = function()
			require("colorizer").setup({

				user_default_options = {
					RGB = true,
					RRGGBB = true,
					names = true,
					css = true,
					css_fn = true,
					mode = "background",
					tailwind = true,
					always_update = true,
					virtualtext = "■",
				},
			})
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		ft = "markdown", -- test
		config = function()
			require("render-markdown").setup({
				latex = { enabled = false },
				heading = {
					icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
					signs = { "󰜴 " },
					border = true,
					above = "▄",
					below = "▀",
				},
			})
		end,
	},

	{
		"rockyzhang24/arctic.nvim",
		branch = "v2",
		dependencies = { "rktjmp/lush.nvim" },
		enabled = false,
		config = function()
			vim.cmd("colorscheme arctic")
		end,
	},

	{
		"askfiy/visual_studio_code",
		priority = 100,
		config = function()
			vim.cmd([[colorscheme visual_studio_code]])
			require("visual_studio_code").setup({
				-- `dark` or `light`
				mode = "dark",
				-- Whether to load all color schemes
				preset = true,
				-- Whether to enable background transparency
				transparent = true,
				-- Whether to apply the adapted plugin
				expands = {
					hop = false,
					dbui = false,
					lazy = true,
					aerial = false,
					null_ls = false,
					nvim_cmp = true,
					gitsigns = true,
					which_key = true,
					nvim_tree = false,
					lspconfig = true,
					telescope = true,
					bufferline = true,
					nvim_navic = false,
					nvim_notify = true,
					vim_illuminate = false,
					nvim_treesitter = true,
					nvim_ts_rainbow = false,
					nvim_scrollview = false,
					nvim_ts_rainbow2 = false,
					indent_blankline = true,
					vim_visual_multi = false,
				},
				hooks = {
					before = function(conf, colors, utils) end,
					after = function(conf, colors, utils) end,
				},
			})
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },
}
