local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("luca.lsp.lsp-installer")
require("luca.lsp.handlers").setup()
