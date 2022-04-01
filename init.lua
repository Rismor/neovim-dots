require("movim.plugins")
vim.cmd("source ~/.config/nvim/main.vim")
require("movim.nvim-tree")
require("movim.autopairs")
require("movim.lsp")
require("movim.treesitter")
require("movim.toggleterm")
require("movim.cmp")
require("movim.lualine")

vim.diagnostic.config({
	virtual_text = false,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ update_in_insert = false }
)
