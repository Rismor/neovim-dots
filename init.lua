vim.g.mapleader = " "
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.updatetime = 100
vim.opt.clipboard = "unnamedplus"


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
require("movim.keybinds")


local logCounter = {}

function InsertNextConsoleLog()
    local bufnr = vim.api.nvim_get_current_buf()
    if not logCounter[bufnr] then
        logCounter[bufnr] = 0
    end
    logCounter[bufnr] = logCounter[bufnr] + 1
    local char = string.char(96 + logCounter[bufnr])
    vim.api.nvim_put({'console.log("' .. char .. '");'}, 'l', true, true)
end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        logCounter[bufnr] = 0
    end,
})

vim.api.nvim_set_keymap('n', '<leader>ll', ':lua InsertNextConsoleLog()<CR>', {noremap = true, silent = true})
