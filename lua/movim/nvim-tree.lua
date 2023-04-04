local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end
local tree_cb = nvim_tree_config.nvim_tree_callback

-- local nvim_tree_config= require'nvim-tree.config'
-- local tree_cb =nvim_tree_config.nvim_tree_callback
nvim_tree.setup({
  disable_netrw = true,
  -- nvim_tree_respect_buff_cwd = true,
  hijack_netrw = true,
  auto_reload_on_write = true,
  hijack_unnamed_buffer_when_opening = true,
  -- hijack_directories = true,

  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  -- auto_close = false,
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  -- update_to_buf_dir = {
  -- 	enable = true,
  -- 	auto_open = true,
  -- },
  actions = {
    change_dir = {
      enable = true,
      global = true,
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          deleted = "",
              untracked = "★",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },

      }
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 700,
  },
  view = {
    width = 30,
    -- height = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "H", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
    number = false,
    relativenumber = true,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  -- quit_on_open = true,
  -- git_hl = 1,
  -- disable_window_picker = 0,
  -- root_folder_modifier = ":t",
  -- show_icons = {
  -- 	git = 1,
  -- 	folders = 1,
  -- 	files = 1,
  -- 	folder_arrows = 1,
  -- 	tree_width = 30,
  -- },
})


