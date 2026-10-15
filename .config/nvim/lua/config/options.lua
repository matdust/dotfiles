-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "fzf" -- use fzf-lua as the picker instead of snacks/telescope

-- Inside VSCode (vscode-neovim) there's no lualine, so re-enable the built-in
-- mode message (-- INSERT --, -- VISUAL --, ...) which shows in the status bar.
if vim.g.vscode then
	vim.o.showmode = true
end

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

-- snacks.image probes the terminal with XTVERSION, but inside tmux that reply
-- doesn't come back reliably, so it never learns it's talking to ghostty. It
-- then falls back to absolutely-positioned images instead of unicode
-- placeholders, which breaks on redraw and in floating previews (fzf-lua).
-- Telling it outright skips the probe. (tmux rewrites TERM_PROGRAM to "tmux",
-- so ask tmux who its client is.)
if not vim.g.vscode then
	local term = vim.env.TERM_PROGRAM
	if vim.env.TMUX then
		local ok, out = pcall(vim.fn.system, { "tmux", "display-message", "-p", "#{client_termname}" })
		term = ok and vim.trim(out) or term
	end
	if term and term:lower():find("ghostty") then
		vim.env.SNACKS_GHOSTTY = "1"
	end
end
