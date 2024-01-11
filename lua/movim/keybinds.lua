-- Window / Buffer keybinds --
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', {})
vim.api.nvim_set_keymap('n', '<leader><Tab>', '<C-^>', {})

-- LSP Bindings --
vim.api.nvim_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lk', ':lua vim.lsp.buf.hover()<CR>', {})
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {})

-- Buffer keybinds --
vim.api.nvim_set_keymap('n', '<leader>]', ':bnext<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>[', ':bprev<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>d', ':bd<CR>', {})


-- Copy Paste binds --
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {})
vim.api.nvim_set_keymap('i', '<C-v>', '<Esc>"+p', {})

vim.api.nvim_set_keymap('n', '<leader>y', '"+y', {})
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {})

-- Jumpto Directory keybinds --
vim.api.nvim_set_keymap('n', '<leader>cds', ':e ~/Documents/School/mod4/<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>cdd', ':e ~/Documents/Development/<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>cdn', ':e ~/.config/nvim/init.lua<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>r', ':e ~/.reminders<CR>', { noremap = true })

-- General Keybinds --
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><leader>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<expr> <Tab>', 'search("\\%#[]>)}$\'\'"`]", "n") ? "<Right>" : "<Tab>"', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'ddp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', 'ddkP', { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':make<CR>', { noremap = true, silent = true })


-- Telescope Keybinds --
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':Telescope colorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', ':Telescope keymaps<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope spell_suggest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ld', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope live_grep<CR>', { noremap = true, silent = true })





vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward-to)')


-- This tabs out of the closing chars: ")]} etc.
_G.smart_tab = function()
  local chars = [=[[]>)}$''"`]]=]
  if vim.fn.search(chars, 'n') ~= 0 then
    -- The return is interpreted literally rather than as a string
    -- Use nvim_replace_termcodes to properly encode the key sequence
    return vim.api.nvim_replace_termcodes('<Right>', true, true, true)
  else
    return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
  end
end
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', { expr = true, noremap = true, silent = true })
