local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "rust_analyzer" then
    require('rust-tools').setup {
      tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
          use_telescope = true,
        },

        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "=>",
          other_hints_prefix = "",
        },

        hover_actions = {
          auto_focus = true
        },
      },

      -- All the opts here send to nvim-lspconfig
      -- They override the defaults set by rust--tools.nvim
      server = {
        --on_attach is a callback when the language server attaches to the
        --buffer
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy"
            },
          }
        }
      },

      opts = vim.tbl_deep_extend("force", server:get_default_options(), opts)
    }
    server:attach_buffers()
    require("rust-tools").start_standalone_if_required()
  elseif server.name == "pyright" then
    require('lspconfig').pyright.setup {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off"
          }
        }
      }
    }

  end
  server:setup(opts)
end)
