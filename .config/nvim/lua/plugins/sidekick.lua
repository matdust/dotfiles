return {
	"folke/sidekick.nvim",
	opts = {
		cli = {
			win = {
				layout = "float",
				float = {
					width = 0.8,
					height = 0.8,
				},
				keys = {
					hide_esc = { "<esc><esc>", "hide", mode = "t", desc = "hide the terminal window" },
				},
			},
		},
	},
}
