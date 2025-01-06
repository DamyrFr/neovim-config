local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"f-person/git-blame.nvim",
	{
	  'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
      		dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'someone-stole-my-name/yaml-companion.nvim',
	  dependencies = {
	      'neovim/nvim-lspconfig',
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope.nvim'
	  },
		config = function()
		  require("telescope").load_extension("yaml_schema")
		end
	},
	{
  "NeogitOrg/neogit",
	  tag = 'v0.0.1',
	  dependencies = {
	    "nvim-lua/plenary.nvim",         -- required
	    "sindrets/diffview.nvim",        -- optional - Diff integration
	  },
	  config = true
	},
	{
			"Bekaboo/deadcolumn.nvim"
	},
	{
	  "sontungexpt/sttusline",
	  dependencies = {
	      "nvim-tree/nvim-web-devicons",
	  },
	  event = { "BufEnter" },
	  config = function(_, opts)
	      require("sttusline").setup {
	          statusline_color = "StatusLine",
	          -- | 1 | 2 | 3
	          -- recommended: 3
	          laststatus = 3,
	          disabled = {
	              filetypes = {
	                  -- "NvimTree",
	                  -- "lazy",
	              },
	              buftypes = {
	                  -- "terminal",
	              },
	          },
	          components = {
	              "mode",
	              "filename",
	              "git-branch",
	              "git-diff",
	              "%=",
	              "diagnostics",
	              "lsps-formatters",
	              "copilot",
	              "indent",
	              "encoding",
	              "pos-cursor",
	              "pos-cursor-progress",
	          },
	      }
	  end,
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		config = function()
		  require("hlchunk").setup({})
		end
	},
	"taybart/b64.nvim",
	"nvim-treesitter/nvim-treesitter",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim"
})
