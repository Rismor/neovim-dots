local plugins_list = {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.cmd([[colorscheme vscode]])
    end
  },

  { "morhetz/gruvbox" },                             -- gruvbox theme
  { "nvim-lua/popup.nvim" },                         -- required for a bunch of plugins
  { "folke/trouble.nvim" },                          -- pretty list of diagnostics and quickfixes
  { "nvim-lua/plenary.nvim" },                       -- required for a bunch of plugins
  { "nvim-telescope/telescope.nvim" },               -- popup windows
  { "windwp/nvim-ts-autotag" },                      -- use treesitter to close tags
  { "nvim-ts-context-commentstring" },               -- use treesitter to comment
  { "tpope/vim-surround" },                          -- change Surround
  { "tpope/vim-repeat" },                            -- hack vim .
  { "tpope/vim-commentary" },                        -- gcc comments
  { "ggandor/leap.nvim" },                           -- movement plugin
  { 'MunifTanjim/prettier.nvim' },                   -- opinionated formatter
  { "folke/neodev.nvim" },                           -- nvim lua api
  { "L3MON4D3/LuaSnip" },                            -- snippet engine for neovim
  { "ray-x/lsp_signature.nvim" },                    -- get signature hints (args) for functions
  { "TimUntersberger/neogit",       config = true }, -- neogit.
  { "telescope-ui-select.nvim" },                    -- popup telescope window on select prompts
  { "stevearc/dressing.nvim" },                      -- popup window for mason filter language
  { "hrsh7th/nvim-cmp" },                            -- autocomplete for neovim
  { "hrsh7th/cmp-nvim-lsp" },                        -- suggest from lsp
  { "hrsh7th/cmp-buffer" },                          -- suggest from buffer
  { "hrsh7th/cmp-path" },                            -- suggest from path
  { "hrsh7th/cmp-vsnip" },                           -- suggest from snippets
  { "Shougo/neomru.vim" },                           -- track recently visitied files
  { "windwp/nvim-autopairs" },                       -- break brackets better
  { "nvim-lua/lsp_extensions.nvim" },                -- extends the lsp (inlay hints, diagnostics)
  { "machakann/vim-highlightedyank" },               -- highlight the yanked text
  { "junegunn/fzf.vim" },                            -- fuzzy file finder
  { "nvim-lualine/lualine.nvim" },                   -- lualine.
  { "nvim-tree/nvim-web-devicons",  lazy = true },   -- eye candy icons for nvim-tree
  { "wesleimp/stylua.nvim" },                        -- required for stylua

  -- GLHF below here --

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup()
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').lua_ls.setup {}
      require('lspconfig').svelte.setup {}
      require('lspconfig').tsserver.setup {}
      require('lspconfig').eslint.setup {}
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {}
    end
  },

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

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines")
    end,
    vim.diagnostic.config({ virtual_text = false }) -- virtual text duplicates lsp lines
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
    }
  },
}

return plugins_list
