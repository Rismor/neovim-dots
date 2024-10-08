return {
  "wesleimp/stylua.nvim",         -- required for stylua
  "j-hui/fidget.nvim",            -- Install information for lsps
  "nvim-lua/lsp_extensions.nvim", -- extends the lsp (inlay hints, diagnostics)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",         -- auto complete
      "hrsh7th/cmp-nvim-lsp",     -- suggest from lsp
      "L3MON4D3/LuaSnip",         -- suggest from snippets
      "hrsh7th/cmp-buffer",       -- suggest from buffer
      "hrsh7th/cmp-path",         -- suggest from path
      "hrsh7th/cmp-emoji",        -- suggest from emojis
      "ray-x/lsp_signature.nvim", -- get signature hints (args) for functions,
      "ray-x/lsp_signature.nvim", -- get signature hints (args) for functions
    },

    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "lua_ls",
          "svelte",
          "tsserver",
          "pylsp"
        },
        handlers = {
          function(server_name) -- default handler
            require("lspconfig")[server_name].setup {}
          end,
          ['lua_ls'] = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            }
          end,
          ['tsserver'] = function()
            local lspconfig = require('lspconfig')
            lspconfig.tsserver.setup {
              init_options = {
                preferences = {
                  disableSuggestions = true
                }
              }
            }
          end,
          ['pylsp'] = function()
            local lspconfig = require('lspconfig')
            lspconfig.pylsp.setup {
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      ignore = { 'E501', 'E741' }
                    }
                  }
                }
              }

            }
          end
        }
      })

      local cmp = require('cmp')
      local luasnip = require('luasnip')


      cmp.setup({
        snippet = {
          -- Must Specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
          ["<C-e>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Tab>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end)
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "" }

        },

      })
    end

  },


  {
    "mhartington/formatter.nvim", -- Format plugin for neovim
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          javascript = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          typescript = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          lua = {
            -- stylua
            function()
              return {
                exe = "stylua",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          svelte = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          html = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          css = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
          json = {
            -- prettier
            function()
              return {
                exe = "prettier",
                args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                stdin = true
              }
            end
          },
        }
      })
    end,
    keys = {
      { "<leader>lf", "<cmd>FormatWrite<CR>", desc = "Format file" },
    },
    lazy = false,


  },

  {
    "Maan2003/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
    vim.diagnostic.config({ virtual_text = false })
  },


  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context", -- context using treesitter
      "windwp/nvim-ts-autotag",                  -- use ts to close tags
    },
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        highlight = { enable = true },
        autotag = { enable = true }
      }
      -- local opts = {
      --   highlight = { enable = true },
      --   indent = { enable = true },
      --   ensure_installed = { 'svelte' }
      --  }
    end
  },


  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },



}
