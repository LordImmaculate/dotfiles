return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_insalled = { "lua_ls", "stylua", "clangd", "clang-format", "prettierd", "svelte-language-server" },
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
}
