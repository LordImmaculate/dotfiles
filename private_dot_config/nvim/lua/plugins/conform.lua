return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- This setup tries prettierd first, then falls back to prettier
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					svelte = { "prettierd", "prettier" },
					c = { "cland" },
					hyprlang = { "hyprls" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true, -- Use lsp_fallback = true
				},
			})
		end,
	},
	{

		"zapling/mason-conform.nvim",
	},
}
