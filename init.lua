vim.g.mapleader = " "
vim.opt.shada = "'100,<100,s10,h" -- this might not be needed come back to it later


-- Bootstrap LazyVim
local plugins = require("movim.plugins")

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

require("lazy").setup(plugins, opts)


vim.cmd("source ~/.config/nvim/main.vim")

require("movim.keybinds")
require("movim.nvim-tree")
require("movim.fonts")
require("movim.autopairs")
require("movim.lsp")
require("movim.treesitter")
require("movim.cmp")
require("movim.lualine")
require('movim.vscode')

