-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     local lspconfig = require("lspconfig")
--
--     -- JS / TS
--     lspconfig.ts_ls.setup({
--       on_attach = function(client, bufnr)
--         local opts = { buffer = bufnr, noremap = true, silent = true }
--         vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--         vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--         vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--       end,
--       filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--       cmd = { "typescript-language-server", "--stdio" },
--     })
--   end,
-- }
--j
return {
	"neovim/nvim-lspconfig",
	config = function()
		-- تنظیمات سرور TS/JS
		vim.lsp.config("ts_ls", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		})

		-- فعال کردن سرور
		vim.lsp.enable("ts_ls")

		-- کی‌مپ‌ها وقتی LSP وصل شد
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local opts = { buffer = bufnr, noremap = true, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})
	end,
}
