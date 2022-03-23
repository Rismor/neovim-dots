local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Required Plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	-- USER PLUGINS --

	-- Eye Candy:

	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use("morhetz/gruvbox")
	use("NTBBloodbath/doom-one.vim")
	use("glepnir/dashboard-nvim")
	use("ryanoasis/vim-devicons")
	use({

		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- " Expanded Syntax Higlight Support
	use("fladson/vim-kitty")
	use("mboughaba/i3config.vim")
	use("rust-lang/rust.vim")

	-- " Vim Enhancement Plugins
	use("tpope/vim-surround")
	-- use("tpope/vim-markdown")
	use("tpope/vim-commentary")
	use("tpope/vim-speeddating")
	use("justinmk/vim-sneak")
	use("airblade/vim-rooter")
	use("preservim/vim-markdown")
	-- use 'preservim/nerdtree'
	use("machakann/vim-highlightedyank")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})
	use("akinsho/toggleterm.nvim")
	use({
		"junegunn/fzf",
		run = "fzf#install()",
	})
	use("junegunn/fzf.vim")
	use({
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		run = "cd app && yarn install",
	})
	-- " LSP Plugins
	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp_extensions.nvim")
	use("simrat39/rust-tools.nvim")
	use("ray-x/lsp_signature.nvim")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("L3MON4D3/LuaSnip")
	use("APZelos/blamer.nvim")
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").register_lsp_virtual_lines()
		end,
	})

	-- "Autocomplete Plugins
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("dhruvasagar/vim-table-mode")
	use("windwp/nvim-autopairs")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("stsewd/fzf-checkout.vim")
	use("junegunn/goyo.vim")

	use("ianding1/leetcode.vim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
