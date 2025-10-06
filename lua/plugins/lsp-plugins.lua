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
      "psf/black",                -- black for neovim
    },


    config = function()
      require("mason").setup()

      local servers = { "eslint", "lua_ls", "svelte", "basedpyright" }

      -- Set up capabilities for completion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
      if ok_mlsp then
        -- Configure mason-lspconfig; avoid features that may be incompatible
        -- with the pinned nvim-lspconfig by disabling automatic installation.
        mlsp.setup({
          ensure_installed = servers,
          automatic_installation = false,
          automatic_enable = false,
        })

        -- Configure servers directly via vim.lsp.config
        for _, server_name in ipairs(servers) do
          if server_name == "lua_ls" then
            vim.lsp.config.lua_ls = {
              filetypes = { "lua" },
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                },
              },
            }
            vim.lsp.enable('lua_ls')
          elseif server_name == "basedpyright" then
            vim.lsp.config.basedpyright = {
              cmd = { "basedpyright-langserver", "--stdio" },
              filetypes = { "python" },
              root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }),
              single_file_support = true,
              capabilities = capabilities,
              settings = {
                basedpyright = {
                  analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            }
            vim.lsp.enable('basedpyright')
          elseif server_name == "eslint" then
            vim.lsp.config.eslint = {
              filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
              capabilities = capabilities,
            }
            vim.lsp.enable('eslint')
          elseif server_name == "svelte" then
            vim.lsp.config.svelte = {
              filetypes = { "svelte" },
              capabilities = capabilities,
            }
            vim.lsp.enable('svelte')
          end
        end
      else
        -- Fallback: configure servers directly via vim.lsp.config if mason-lspconfig
        -- fails to load or initialize.
        for _, server_name in ipairs(servers) do
          if server_name == "lua_ls" then
            vim.lsp.config.lua_ls = {
              filetypes = { "lua" },
              settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            }
            vim.lsp.enable('lua_ls')
          elseif server_name == "basedpyright" then
            vim.lsp.config.basedpyright = {
              cmd = { "basedpyright-langserver", "--stdio" },
              filetypes = { "python" },
              root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }),
              single_file_support = true,
              capabilities = capabilities,
              settings = {
                basedpyright = {
                  analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            }
            vim.lsp.enable('basedpyright')
          elseif server_name == "eslint" then
            vim.lsp.config.eslint = {
              filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
              capabilities = capabilities,
            }
            vim.lsp.enable('eslint')
          elseif server_name == "svelte" then
            vim.lsp.config.svelte = {
              filetypes = { "svelte" },
              capabilities = capabilities,
            }
            vim.lsp.enable('svelte')
          end
        end
      end

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
    vim.diagnostic.config({ virtual_text = true })
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
        indent = { enable = true },
        autotag = { enable = true }
      }
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
