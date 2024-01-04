vim.g.mapleader = " "
vim.opt.shada = "'100,<100,s10,h" -- this might not be needed come back to it later
vim.opt.completeopt = { "menu", "menuone", "noselect" }


-- Bootstrap LazyVim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")


vim.cmd("source ~/.config/nvim/main.vim")

require("movim.lsp")
require("movim.lualine")
require('movim.vscode')
require("movim.keybinds")

