-- Window / Buffer keybinds --
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', {})
vim.api.nvim_set_keymap('n', '<leader><Tab>', '<C-^>', {})

-- LSP Bindings --
vim.api.nvim_set_keymap('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>k', ':lua vim.lsp.buf.hover()<CR>', {})
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {})

-- Buffer keybinds --
vim.api.nvim_set_keymap('n', '<leader>]', ':bnext<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>[', ':bprev<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>d', ':bd<CR>', {})

-- Dashboard keybinds --
vim.api.nvim_set_keymap('n', '<leader>D', ':Dashboard<CR>', {})
vim.api.nvim_set_keymap('n', '<silent> <Leader>fr', ':DashboardFindHistory<CR>', {})
vim.api.nvim_set_keymap('n', '<silent> <Leader>ff', ':DashboardFindFile<CR>', {})
vim.api.nvim_set_keymap('n', '<silent> <Leader>cc', ':DashboardChangeColorscheme<CR>', {})
vim.api.nvim_set_keymap('n', '<silent> <Leader>fw', ':DashboardFindWord<CR>', {})
vim.api.nvim_set_keymap('n', '<silent> <Leader>fb', ':DashboardJumpMark<CR>', {})
vim.api.nvim_set_keymap('n', '<silent> <Leader>cn', ':DashboardNewFile<CR>', {})

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

-- Font size keybinds --
vim.api.nvim_set_keymap('n', '<C-=>', ':lua Increment()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-->', ':lua Decrement()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-0>', ':lua Print_font()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-]>', ':lua Casc()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-[>', ':lua Fira()<CR>', { noremap = true })




-- General Keybinds --
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><leader>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', {})
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<Tab>', 'za', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-p>', { noremap = true })
vim.api.nvim_set_keymap('i', '<expr> <Tab>', 'search("\\%#[]>)}$\'\'"`]", "n") ? "<Right>" : "<Tab>"', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-n>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-p>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-t>', { noremap = true })
vim.api.nvim_set_keymap('n', 'J', 'ddp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', 'ddkP', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':make<CR>', { noremap = true, silent = true })

