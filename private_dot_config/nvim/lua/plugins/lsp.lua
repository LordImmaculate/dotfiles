return {
	{
		-- Mason manages external tools
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},

	{
		-- Bridge Mason with lspconfig
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright" },
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = cmp_nvim_lsp.default_capabilities(),
						on_attach = function(_, bufnr)
							-- Define your keymaps here
							local opts = { buffer = bufnr, silent = true }
							vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
							vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						end,
					})
				end,
			})
		end,
	},

	{
		-- Formatter integration
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		-- Linter integration
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "InsertLeave" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				lua = { "luacheck" },
				python = { "ruff" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
			}

			-- Run linting on save
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
