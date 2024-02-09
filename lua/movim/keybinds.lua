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


-- Jumpto Directory keybinds --
vim.api.nvim_set_keymap('n', '<leader>cdn', ':e ~/.config/nvim/init.lua<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>r', ':e ~/org/todo.org<CR>', { noremap = true })

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
vim.api.nvim_set_keymap('n', '<leader>m', ':!make<CR>', { noremap = true, silent = true })

-- Telescope Keybinds --
-- vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fp', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':Telescope colorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', ':Telescope keymaps<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope spell_suggest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ld', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope live_grep<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })

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



-- Function to insert console.log with the current word and filename
_G.insert_console_log = function()    -- Get the current word
    local current_word = vim.fn.expand("<cword>")

    -- Get the filename
    local filename = vim.fn.expand("%:t")

    -- Construct the log string
    local log_str = string.format("console.log(`%s %s ${%s} ${typeof %s}`)", filename, current_word, current_word, current_word)

    -- Insert the log string on the line below
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {log_str})
end

-- Set the keybinding
vim.api.nvim_set_keymap('n', '<leader>lc', ':lua insert_console_log()<CR>', {noremap = true, silent = true})
