local plugins_list = {
  {
    "Mofiqul/vscode.nvim",
    config = function ()
      vim.cmd([[colorscheme vscode]])
    end
  },

  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  { "justinmk/vim-sneak" },
  { "airblade/vim-rooter" },
  { "machakann/vim-highlightedyank" },
  { 
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup{}
    end
  },
  { "nvim-tree/nvim-web-devicons", lazy = true }, 
  { "williamboman/mason.nvim" },
  -- {
  --   "arsham/fzfmania.nvim",
  --   dependencies = {
  --     "arsham/arshlib.nvim",
  --     "fzf.vim",
  --     "plenary.nvim",
  --     },
  --     event = { "VeryLazy" },
  --   },
  { "junegunn/fzf.vim" },
  {
    "junegunn/fzf",
    build = "fzf#install()",
    tag = '*'
  },
  {
    'ThePrimeagen/harpoon',
    keys = {
      {"<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc="Harpoon File 1"},
      {"<C-j>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", desc="Harpoon File 2"},
      {"<C-k>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", desc="Harpoon File 3"},
      {"<C-l>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", desc="Harpoon File 4"},
      {"<C-e>", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc="Add a file to the shotlist"},
      {"<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc="List the shotlist"}
    }
  },

  { "ggandor/lightspeed.nvim" },
  { 'MunifTanjim/prettier.nvim' },
  { "L3MON4D3/LuaSnip" },
  { "ray-x/lsp_signature.nvim" },
  { "lewis6992/gitsigns.nvim" },
  { "TimUntersberger/neogit", config=true },
  { "akinsho/bufferline.nvim", tag = '*' },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  { "windwp/nvim-autopairs" },
  { "github/copilot.vim" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/lsp_extensions.nvim" },
  { "williamboman/nvim-lsp-installer" },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines")

    end,
      vim.diagnostic.config({virtual_text = false}) -- virtual text duplicates lsp lines
  },
  {
    "nvim-lualine/lualine.nvim" -- see how u r supposed to load in devicons and they are lazy loaded so care
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = {enable = true},
      indent = {enable = true},
    }
  },
}

return plugins_list
