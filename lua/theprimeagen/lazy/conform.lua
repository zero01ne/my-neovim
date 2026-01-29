return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				rust = { "rustfmt", lsp_format = "fallback" },

				python = function(bufnr)
					if conform.get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,

				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
				elixir = { "mix" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},

			-- 🔧 تنظیم اختصاصی برای prettier:
			formatters = {
				prettier = {
					command = "prettier",
					args = {
						"--stdin-filepath",
						"$FILENAME",
						"--tab-width",
						"4", -- 👈 چهار فاصله
						"--use-tabs",
						"true",
					},
				},
			},

			default_format_opts = {
				lsp_format = "fallback",
			},

			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},

			log_level = vim.log.levels.ERROR,
			notify_on_error = true,
			notify_no_formatters = true,
		})
	end,
}
