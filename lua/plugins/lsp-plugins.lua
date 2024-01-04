return  {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "lua_ls",
          "svelte",
          "tsserver",
        },
        handlers = {
          function(server_name) -- default handler
            require("lspconfig")[server_name].setup {}
          end
        }
      })
    end

  },

  { "folke/neodev.nvim",           opts = {} }, -- nvim lua api
  { "ray-x/lsp_signature.nvim" },               -- get signature hints (args) for functions


  { "nvim-lua/lsp_extensions.nvim" }, -- extends the lsp (inlay hints, diagnostics)
  { "wesleimp/stylua.nvim" },         -- required for stylua
  { "ray-x/lsp_signature.nvim" },     -- get signature hints (args) for functions


  { "hrsh7th/nvim-cmp" },       -- autocomplete for neovim
  { "hrsh7th/cmp-nvim-lsp" },   -- suggest from lsp
  { "hrsh7th/cmp-buffer" },     -- suggest from buffer
  { "hrsh7th/cmp-path" },       -- suggest from path
  { "L3MON4D3/LuaSnip" },       -- suggest from sinnepts
  { "zbirenbaum/copilot-cmp" }, -- suggest from copilot
  --  { "hrsh7th/cmp-vsnip" },                      -- suggest from snippets


  { "j-hui/fidget.nvim" },            -- Install information for lsps
  { "nvim-lua/lsp_extensions.nvim" }, -- extends the lsp (inlay hints, diagnostics)
  --{ "wesleimp/stylua.nvim" },                        -- required for stylua
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

