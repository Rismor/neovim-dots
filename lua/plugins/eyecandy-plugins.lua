return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require('vscode').setup({
        style = 'dark',
        italic_comments = true,
      })
      vim.cmd([[colorscheme vscode]])
    end
  },

  { "nvim-telescope/telescope.nvim" }, -- popup windows
  { 'MunifTanjim/prettier.nvim' },     -- opinionated formatter
  { "telescope-ui-select.nvim" },      -- popup telescope window on select prompts
  { "stevearc/dressing.nvim" },        -- popup window for mason filter language
  { "telescope-ui-select.nvim" },      -- popup telescope window on select prompts
  { "stevearc/dressing.nvim" },        -- popup window for mason filter language
  { "machakann/vim-highlightedyank" }, -- highlight the yanked text
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require('lualine')
      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          always_divide_middle = true,
          disabled_filetypes = { "neo-tree" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              path = 1,            -- Display full file path
              file_status = true,  -- Show file status (modified, etc.)
              path_separator = ' > ' -- Separator between folder and file name
            }
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end
  },
  { "nvim-tree/nvim-web-devicons", lazy = true }, -- eye candy icons for nvim-tree
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
}
