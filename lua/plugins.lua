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
	"lewis6991/gitsigns.nvim",
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
	"nvim-treesitter/nvim-treesitter",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons"
})
