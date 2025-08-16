return {
  "nvim-lua/popup.nvim",             -- required for a bunch of plugins
  "nvim-lua/plenary.nvim",           -- required for a bunch of plugins
  "tpope/vim-surround",              -- change Surround
  "tpope/vim-repeat",                -- hack vim .
  "tpope/vim-commentary",            -- gcc comments
  "ggandor/leap.nvim",               -- movement plugin
  "Shougo/neomru.vim",               -- track recently visitied files
  {
    'cameron-wags/rainbow_csv.nvim', -- rainbow csv
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>lp", "<cmd>Trouble<cr>", "open the trouble window" }
    }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- load once insert mode is entered
    opts = {}
  },                       -- insert closing brackets
  {
    'ThePrimeagen/harpoon',
    keys = {
      { "<C-h>",      "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",         desc = "Harpoon File 1" },
      { "<C-j>",      "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",         desc = "Harpoon File 2" },
      { "<C-k>",      "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",         desc = "Harpoon File 3" },
      { "<C-l>",      "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",         desc = "Harpoon File 4" },
      { "<C-e>",      "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Add a file to the shotlist" },
      { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "List the shotlist" }
    },
    lazy = false
  },
  {
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",              -- image support in preview window: See `# Preview Mode` for more information
      },
      keys = {
        { "<C-n>", "<cmd>Neotree toggle=true<CR>" }
      }
    }
  },

  "tpope/vim-fugitive",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup {
        signs                        = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          follow_files = true
        },
        auto_attach                  = true,
        attach_to_untracked          = false,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        }
      }
    end
  },
  { "TimUntersberger/neogit", config = true }, -- neogit.
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' }
  },
  { "ahmedkhalf/project.nvim" },
  { "stevearc/oil.nvim" }
}
