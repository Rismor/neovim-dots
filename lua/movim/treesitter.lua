require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'cmake' },
  ignore_install = {"help"}, -- Squashes parser not available for language help bug
  sync_install = false,
  highlight = {
    enable = true,
    }
  }
