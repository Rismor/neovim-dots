local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("movim.lsp.handlers").on_attach,
		capabilities = require("movim.lsp.handlers").capabilities,
	}

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("movim.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "rust_analyzer" then
		require("rust-tools").setup({
			tools = {
				inlay_hints = {
					show_parameter_hints = true,
					parameter_hints_prefix = "=>",
					other_hints_prefix = "",
				},

				hover_actions = {
					auto_focus = true,
				},
			},

      -- server = {
      --   settings = {
      --     ["rust-analyzer"] = {
      --       checkOnSave = {
      --         command = "clippy",
      --       },
      --     }
      --   }
      -- },
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
  server:attach_buffers()
  require("rust-tools")-- .start_standalone_if_required()
else
	server:setup(opts)
	end

end)
