return {
  "nvim-lua/popup.nvim",                       -- required for a bunch of plugins
  "folke/trouble.nvim",                        -- pretty list of diagnostics and quickfixes
  "nvim-lua/plenary.nvim",                     -- required for a bunch of plugins
  "tpope/vim-surround",                        -- change Surround
  "tpope/vim-repeat",                          -- hack vim .
  "tpope/vim-commentary",                      -- gcc comments
  "ggandor/leap.nvim",                         -- movement plugin
  "Shougo/neomru.vim",                         -- track recently visitied files
  "folke/trouble.nvim",
  { "TimUntersberger/neogit", config = true }, -- neogit.
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
      }
    }
  },
}
