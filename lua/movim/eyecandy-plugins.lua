local EyecandyPlugins = {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      vim.cmd([[colorscheme vscode]])
    end
  },

  { "nvim-telescope/telescope.nvim" },               -- popup windows
  { 'MunifTanjim/prettier.nvim' },                   -- opinionated formatter
  { "telescope-ui-select.nvim" },                    -- popup telescope window on select prompts
  { "stevearc/dressing.nvim" },                      -- popup window for mason filter language


}

return EyecandyPlugins
