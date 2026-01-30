-- Window / Buffer keybinds --
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', {})
vim.api.nvim_set_keymap('n', '<leader><Tab>', '<C-^>', {})

-- LSP Bindings --
-- vim.api.nvim_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lf',
  [[:lua if vim.bo.filetype == 'python' then vim.cmd('write | !black %') else vim.lsp.buf.format({ async = true }) end<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lk', ':lua vim.lsp.buf.hover()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lr', ':e<CR>', {})
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {})

-- Buffer keybinds --
vim.api.nvim_set_keymap('n', '<leader>]', ':bnext<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>[', ':bprev<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>d', ':bd<CR>', {})


-- Jumpto Directory keybinds --
vim.api.nvim_set_keymap('n', '<leader>cdn', ':e ~/.config/nvim/init.lua<CR>', {})

-- General Keybinds --
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><leader>', ':w<CR>', {})
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR><CR>', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<expr> <Tab>', 'search("\\%#[]>)}$\'\'"`]", "n") ? "<Right>" : "<Tab>"', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'J', 'ddp', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'K', 'ddkP', { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':!make<CR>', { noremap = true, silent = true })

-- Telescope Keybinds --
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fp', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cc', ':Telescope colorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', ':Telescope keymaps<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope spell_suggest<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ld', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ll', ':lua require("telescope.builtin").lsp_document_symbols()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lm', ':lua require("telescope.builtin").lsp_document_symbols({ symbols = {"method"} })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', ':lua require("telescope.builtin").lsp_document_symbols({ symbols = {"class"} })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':lua require("telescope.builtin").lsp_document_symbols({ symbols = {"variable"} })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lF', ':lua require("telescope.builtin").lsp_document_symbols({ symbols = {"function"} })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>TodoTelescope<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ln', '<cmd>Navbuddy<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })

-- Fuzzy search current buffer with /
local function _fuzzy_qf_info()
  if not vim.g.fuzzy_qf_id then
    return nil
  end

  local info = vim.fn.getqflist({ id = 0, size = 0, idx = 0 })
  if info.id == vim.g.fuzzy_qf_id and info.size > 0 then
    return info
  end
  return nil
end

_G.fuzzy_qf_status = function()
  local info = _fuzzy_qf_info()
  if not info then
    return ""
  end
  return string.format("Fuzzy / %d/%d", info.idx, info.size)
end

local function _get_fuzzy_qf_items()
  if not vim.g.fuzzy_qf_id then
    return nil
  end

  local info = vim.fn.getqflist({ id = vim.g.fuzzy_qf_id, items = 1 })
  if not info or info.id ~= vim.g.fuzzy_qf_id or not info.items then
    return nil
  end
  return info.items
end

local function _fuzzy_results_lines()
  local items = _get_fuzzy_qf_items()
  if not items or #items == 0 then
    return nil
  end

  local lines = {}
  for _, item in ipairs(items) do
    local text = item.text
    if not text or text == "" then
      local ok, buf_lines = pcall(vim.api.nvim_buf_get_lines, item.bufnr, item.lnum - 1, item.lnum, false)
      if ok and buf_lines and buf_lines[1] then
        text = buf_lines[1]
      else
        text = ""
      end
    end
    table.insert(lines, text)
  end

  return lines
end

local function _ensure_fuzzy_results_buf()
  local bufnr = vim.g.fuzzy_results_bufnr
  if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    return bufnr
  end

  bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_name(bufnr, "Fuzzy / Results")
  vim.bo[bufnr].buftype = "nofile"
  vim.bo[bufnr].bufhidden = "wipe"
  vim.bo[bufnr].swapfile = false
  vim.bo[bufnr].modifiable = true
  vim.g.fuzzy_results_bufnr = bufnr
  return bufnr
end

local function _update_fuzzy_results_buffer()
  local lines = _fuzzy_results_lines()
  if not lines then
    return
  end

  local bufnr = _ensure_fuzzy_results_buf()
  vim.bo[bufnr].modifiable = true
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.bo[bufnr].modifiable = false

  vim.fn.setreg('t', table.concat(lines, "\n"), 'l')
end

vim.keymap.set('n', '/', function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    previewer = false,
    sorting_strategy = "ascending",
    attach_mappings = function(_, map)
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      local function safe_close(prompt_bufnr)
        local state = require("telescope.state")
        local status = state.get_status(prompt_bufnr)
        if status and status.picker then
          pcall(actions.close, prompt_bufnr)
          return
        end
        if vim.api.nvim_buf_is_valid(prompt_bufnr) then
          pcall(vim.api.nvim_buf_delete, prompt_bufnr, { force = true })
        end
      end

      local function select_and_set_search(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        if not entry then
          safe_close(prompt_bufnr)
          return
        end

        -- Populate quickfix with all results (exactly what Telescope shows)
        actions.send_to_qflist(prompt_bufnr)
        safe_close(prompt_bufnr)

        local qf_list = vim.fn.getqflist()
        if #qf_list > 0 then
          local target_idx = 1
          for i, item in ipairs(qf_list) do
            if item.lnum == entry.lnum and (entry.col == nil or item.col == entry.col) then
              target_idx = i
              break
            end
          end
          vim.fn.setqflist({}, 'r', { items = qf_list, title = "Fuzzy /", idx = target_idx })
          local qf_info = vim.fn.getqflist({ id = 0 })
          if qf_info and qf_info.id then
            vim.g.fuzzy_qf_id = qf_info.id
          end
        end

        _update_fuzzy_results_buffer()

        -- Jump to the line
        vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col or 0 })
      end

      -- Override default select to also set the search register
      map('i', '<CR>', select_and_set_search)
      map('n', '<CR>', select_and_set_search)

      return true
    end,
  })
end, { noremap = true, silent = true })

vim.api.nvim_create_user_command("FuzzyResults", function()
  _update_fuzzy_results_buffer()
  local bufnr = vim.g.fuzzy_results_bufnr
  if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
    vim.notify("No fuzzy results yet", vim.log.levels.INFO)
    return
  end
  vim.cmd("split")
  vim.api.nvim_win_set_buf(0, bufnr)
end, {})

-- Paste fuzzy results (register t) with <leader>p
vim.keymap.set('n', '<leader>p', '"tp', { noremap = true, silent = true })

-- Use n/N to move through Telescope fuzzy results when available
vim.keymap.set('n', 'n', function()
  if _fuzzy_qf_info() then
    local ok = pcall(vim.cmd, 'cnext')
    if not ok then
      pcall(vim.cmd, 'normal! n')
    end
  else
    pcall(vim.cmd, 'normal! n')
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', 'N', function()
  if _fuzzy_qf_info() then
    local ok = pcall(vim.cmd, 'cprev')
    if not ok then
      pcall(vim.cmd, 'normal! N')
    end
  else
    pcall(vim.cmd, 'normal! N')
  end
end, { noremap = true, silent = true })

-- Fugitive Git Conflict Resolution Keybinds --
vim.api.nvim_set_keymap('n', '<leader>gm', ':Gvdiffsplit!<CR>', { noremap = true, silent = true }) -- 3-way merge view
vim.api.nvim_set_keymap('n', '<leader>gh', ':diffget //2<CR>', { noremap = true, silent = true })  -- get from left (HEAD/target)
vim.api.nvim_set_keymap('n', '<leader>gl', ':diffget //3<CR>', { noremap = true, silent = true })  -- get from right (merge branch)
vim.api.nvim_set_keymap('n', '<leader>gw', ':Gwrite<CR>', { noremap = true, silent = true })       -- stage resolved file


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



-- Function to copy file path in folder/folder/filename.ext format
_G.copy_file_path = function()
  -- Get the current file path relative to the current working directory
  local filepath = vim.fn.expand("%:.")
  
  -- Copy to system clipboard
  vim.fn.setreg("+", filepath)
  
  -- Show a message to confirm the copy
  vim.notify("Copied to clipboard: " .. filepath)
end

-- Set the keybinding for copying file path
vim.api.nvim_set_keymap('n', '<leader>cp', ':lua copy_file_path()<CR>', { noremap = true, silent = true })

-- Set the keybind for opening

-- Neovide Font Scaling --
if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0

  local function change_scale_factor(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.1) end, { noremap = true, silent = true, desc = "Neovide: Increase font size" })
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1/1.1) end, { noremap = true, silent = true, desc = "Neovide: Decrease font size" })
end
