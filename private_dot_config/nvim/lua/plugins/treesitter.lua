return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	-- branch = 'main',
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c", "lua", "python", "html", "javascript" },

			auto_install = true,

			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},
		})
	end,
}
