require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'cmake' },
  sync_install = false,
  highlight = {
    enable = true,
    }
  }
