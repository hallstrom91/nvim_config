return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*",
      dependencies = {
    "rafamadriz/friendly-snippets",
  },
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
}
