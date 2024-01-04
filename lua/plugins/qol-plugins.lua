return {
  { "nvim-lua/popup.nvim" },                         -- required for a bunch of plugins
  { "folke/trouble.nvim" },                          -- pretty list of diagnostics and quickfixes
  { "nvim-lua/plenary.nvim" },                       -- required for a bunch of plugins
  { "windwp/nvim-ts-autotag" },                      -- use treesitter to close tags
  { "nvim-ts-context-commentstring" },               -- use treesitter to comment
  { "tpope/vim-surround" },                          -- change Surround
  { "tpope/vim-repeat" },                            -- hack vim .
  { "tpope/vim-commentary" },                        -- gcc comments
  { "ggandor/leap.nvim" },                           -- movement plugin
  { "TimUntersberger/neogit",       config = true }, -- neogit.
  { "Shougo/neomru.vim" },                           -- track recently visitied files
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  }, -- insert closing brackets
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   config = function()
  --     require("nvim-tree").setup {}
  --   end
  -- },
  {
    "junegunn/fzf",
    build = "fzf#install()",
    tag = '*'
  },
  {
    'ThePrimeagen/harpoon',
    keys = {
      { "<C-h>",      "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",         desc = "Harpoon File 1" },
      { "<C-j>",      "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",         desc = "Harpoon File 2" },
      { "<C-k>",      "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",         desc = "Harpoon File 3" },
      { "<C-l>",      "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",         desc = "Harpoon File 4" },
      { "<C-e>",      "<cmd>lua require('harpoon.mark').add_file()<CR>",        desc = "Add a file to the shotlist" },
      { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "List the shotlist" }
    }
  },


}
