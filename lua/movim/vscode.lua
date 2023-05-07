local c = require('vscode.colors').get_colors()
require('vscode').setup({
  style = 'dark',
  italic_comments = true,
  disable_nvimtree_bg = false,
  color_overrides = {
    vscLineNumber = '#FFFFFF',
  },
})

require('vscode').load()
