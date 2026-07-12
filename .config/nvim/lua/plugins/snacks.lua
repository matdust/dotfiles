return {
	"folke/snacks.nvim",
	opts = {
		scroll = { enabled = false },
		picker = {
			sources = {
				explorer = {
					layout = { preset = "default", preview = true },
					auto_close = true,
					jump = { close = true },
				},
			},
		},
	},
}
