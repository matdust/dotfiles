return {
	"folke/snacks.nvim",
	opts = {
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
