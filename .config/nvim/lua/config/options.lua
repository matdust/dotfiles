-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true -- show the absolute number on the current line
vim.opt.relativenumber = true -- ...and relative numbers everywhere else

vim.o.winborder = "rounded" -- default border for all floating windows (LSP hover, etc.)
-- Cursor blinking configuration
vim.opt.guicursor = {
	"n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon500-blinkoff500", -- Normal, Visual, Command modes
	"i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon500-blinkoff500", -- Insert mode
	"r-cr:hor20-Cursor/lCursor-blinkwait1000-blinkon500-blinkoff500", -- Replace mode
}

-- Disable all inline diagnostics except tiny-inline-diagnostic
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.env.PATH = "/Library/TeX/texbin:" .. vim.env.PATH
