return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- Load at insert mode
	config = function()
		local autopairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")

		autopairs.setup({
			-- test
			disable_filetype = { "TelescopePrompt", "dashboard" },
			check_ts = true,
		})

		-- test rule - TO NOT add () to imported modules in js,jsx,tsx files
		autopairs.add_rules({
			Rule("{", "}"):with_pair(function(opts)
				local line = opts.line
				return not line:match("^%s*import%s*{.*") -- If row starts with "import { "
			end),

			Rule(";", ""):with_pair(function(opts)
				local line = opts.line
				return line:match("^%s*import%s+.*;$") ~= nil
			end),

			--[[ 			Rule("<", ">")
				:with_pair(function(opts)
					local line = opts.line
					return not line:match("%W%(")
				end)
				:with_move(function(opts)
					return opts.prev_char:match(".%>") ~= nil
				end)
				:use_key(">"), ]]
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
