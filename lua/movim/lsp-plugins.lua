local LspPLugins = {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",

      config = function()
        require("mason").setup()
        require('mason-lspconfig').setup({
          ensure_installed = {
            "eslint",
            "lua_ls",
            "stylua",
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
  },
  { "folke/neodev.nvim",           opts = {} }, -- nvim lua api

  { "ray-x/lsp_signature.nvim" },               -- get signature hints (args) for functions
  { "hrsh7th/cmp-nvim-lsp" },                   -- suggest from lsp
  { "hrsh7th/cmp-buffer" },                     -- suggest from buffer
  { "hrsh7th/cmp-path" },                       -- suggest from path
  { "hrsh7th/cmp-vsnip" },                      -- suggest from snippets
  { "j-hui/fidget.nvim" },                      -- suggest from snippets
  { "hrsh7th/cmp-vsnip" },                      -- suggest from snippets
  { "zbirenbaum/copilot-cmp" },                 -- suggest from copilot

  { "nvim-lua/lsp_extensions.nvim" },           -- extends the lsp (inlay hints, diagnostics)
  { "wesleimp/stylua.nvim" },                   -- required for stylua

}

return LspPLugins
