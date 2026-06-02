return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
				solid = true,
			},
			no_italic = true,
			lsp_styles = {
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				fzf = true,
				grug_far = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				mini = true,
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				snacks = true,
				telescope = true,
				treesitter_context = true,
				which_key = true,
				treesitter = true,
				native_lsp = { enabled = true },
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		opts = {
			style = "moon",
			styles = {
				comments = { italic = true },
				keywords = { italic = false },
				functions = {},
				variables = {},
				-- sidebars = "transparent",
				-- floats = "transparent",
			},
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "moon",
			styles = {
				italic = false,
			},
		},
	},
	{
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_better_performance = 1
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},
}
