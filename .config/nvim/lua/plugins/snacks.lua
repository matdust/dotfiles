return {
	"folke/snacks.nvim",
	opts = {
		scroll = { enabled = false },
		image = { enabled = true },
		picker = {
			sources = {
				explorer = {
					-- persistent tree sidebar docked on the left
					layout = {
						preset = "sidebar",
						preview = false,
						hidden = { "input" }, -- no search bar; `/` toggles it
						layout = { position = "left", width = 35 },
					},
					win = { list = { keys = { ["/"] = "toggle_input" } } },
					auto_close = false,
					jump = { close = false },
				},
			},
		},
	},
	init = function()
		-- snacks.nvim bug: when an image buffer is no longer shown in any window,
		-- Placement:update() calls hide(), which latches `hidden = true`. Only
		-- inline document images ever get a matching show() (image/inline.lua), so
		-- a standalone image buffer stays flagged hidden forever -- and _render()
		-- then strips virt_text/conceal off every extmark, leaving the placeholder
		-- grid blank when you navigate back to it.
		-- Clear the flag once the buffer is on screen again. Inline images are
		-- skipped: they drive `hidden` themselves to conceal under the cursor.
		vim.schedule(function()
			local ok, Placement = pcall(require, "snacks.image.placement")
			if not ok then
				return
			end
			local render = Placement._render
			Placement._render = function(self, extmarks)
				if self.hidden and not self.opts.inline and #self:wins() > 0 then
					self.hidden = false
				end
				return render(self, extmarks)
			end
		end)
	end,
}
