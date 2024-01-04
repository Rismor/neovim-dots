return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require('vscode').setup({
        style = 'dark',
        italic_comments = true,
        disable_nvimtree_bg = false,
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },
      })
      vim.cmd([[colorscheme vscode]])
    end
  },

  { "nvim-telescope/telescope.nvim" },             -- popup windows
  { 'MunifTanjim/prettier.nvim' },                 -- opinionated formatter
  { "telescope-ui-select.nvim" },                  -- popup telescope window on select prompts
  { "stevearc/dressing.nvim" },                    -- popup window for mason filter language
  { "telescope-ui-select.nvim" },                  -- popup telescope window on select prompts
  { "stevearc/dressing.nvim" },                    -- popup window for mason filter language
  { "machakann/vim-highlightedyank" },             -- highlight the yanked text
  { "nvim-lualine/lualine.nvim" },                 -- lualine.
  { "nvim-tree/nvim-web-devicons",  lazy = true }, -- eye candy icons for nvim-tree
  { "ellisonleao/gruvbox.nvim" }                   -- gruvbox

}
