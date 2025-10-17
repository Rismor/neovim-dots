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
      "ray-x/lsp_signature.nvim", -- get signature hints (args) for functions
      "psf/black",                -- black for neovim
    },


    config = function()
      require("mason").setup()

      local servers = { "lua_ls", "basedpyright", "ruff" }

      -- Set up capabilities for completion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Set up on_attach for navbuddy
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          local navbuddy = require("nvim-navbuddy")
          navbuddy.attach(client, bufnr)
        end
      end

      -- Configure mason-lspconfig
      require("mason-lspconfig").setup({
        ensure_installed = { "basedpyright", "ruff" }, -- Only Python servers auto-installed
        automatic_installation = false,
      })

      -- Configure servers directly via vim.lsp.config
      for _, server_name in ipairs(servers) do
        if server_name == "lua_ls" then
          vim.lsp.config.lua_ls = {
            filetypes = { "lua" },
            capabilities = capabilities,
            on_attach = on_attach,
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
            on_attach = on_attach,
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
        elseif server_name == "ruff" then
          vim.lsp.config.ruff = {
            cmd = { "ruff", "server", "--preview" },
            filetypes = { "python" },
            root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }),
            single_file_support = true,
            capabilities = capabilities,
            on_attach = on_attach,
            init_options = {
              settings = {
                organizeImports = true,
                fixAll = true,
              }
            }
          }
          vim.lsp.enable('ruff')
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
          python = {
            -- black
            function()
              return {
                exe = "black",
                args = { "--quiet", "-" },
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
