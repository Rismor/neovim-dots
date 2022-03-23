local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("movim.lsp.lsp-installer")
require("movim.lsp.handlers").setup()
require("movim.lsp.null-ls")
