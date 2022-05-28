local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
require("luca.lsp.lsp-installer")
require("luca.lsp.handlers").setup()
