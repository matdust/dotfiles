if vim.g.vscode then
	local vscode = require("vscode")

	-- File Operations
	vim.keymap.set("n", "<leader><leader>", function()
		vscode.action("binocular.searchFiles")
	end, { desc = "Search Files" })

	vim.keymap.set("n", "<leader>e", function()
		vscode.action("workbench.view.explorer")
	end, { desc = "Toggle File Explorer" })

	vim.keymap.set("n", "<leader>ff", function()
		vscode.action("binocular.searchFiles")
	end, { desc = "Find File" })

	vim.keymap.set("n", "<leader>fr", function()
		vscode.action("workbench.action.quickOpen")
	end, { desc = "Recent Files" })

	-- Search
	vim.keymap.set("n", "<leader>sg", function()
		vscode.action("binocular.searchContent")
	end, { desc = "Live Grep" })

	vim.keymap.set("n", "<leader>sw", function()
		vscode.action("editor.action.selectHighlights")
	end, { desc = "Search Word" })

	vim.keymap.set("n", "<leader>sd", function()
		vscode.action("binocular.searchDirectories")
	end, { desc = "Search Directory" })

	-- Editor/View
	vim.keymap.set("n", "<leader>wd", function()
		vscode.action("workbench.action.closeActiveEditor")
	end, { desc = "Delete Window" })

	vim.keymap.set("n", "<leader>w-", function()
		vscode.action("workbench.action.splitEditorDown")
	end, { desc = "Split Below" })

	vim.keymap.set("n", "<leader>w|", function()
		vscode.action("workbench.action.splitEditorRight")
	end, { desc = "Split Right" })

	-- Toggles
	vim.keymap.set("n", "<leader>uf", function()
		vscode.action("workbench.action.toggleFullScreen")
	end, { desc = "Toggle Fullscreen" })

	vim.keymap.set("n", "<leader>us", function()
		vscode.action("workbench.action.toggleSidebarVisibility")
	end, { desc = "Toggle Sidebar" })

	vim.keymap.set("n", "<leader>up", function()
		vscode.action("workbench.action.togglePanel")
	end, { desc = "Toggle Panel" })

	-- Git
	vim.keymap.set("n", "<leader>gg", function()
		vscode.action("workbench.view.scm")
	end, { desc = "Git" })

	vim.keymap.set("n", "<leader>gb", function()
		vscode.action("gitlens.openFileHistory")
	end, { desc = "Blame" })

	-- Diagnostics
	vim.keymap.set("n", "<leader>cd", function()
		vscode.action("editor.action.quickFix")
	end, { desc = "Quick Fix" })

	vim.keymap.set("n", "<leader>cD", function()
		vscode.action("workbench.actions.view.problems")
	end, { desc = "Diagnostics" })

	-- Navigation
	vim.keymap.set("n", "<leader>g  d", function()
		vscode.action("editor.action.goToDeclaration")
	end, { desc = "Goto Declaration" })

	vim.keymap.set("n", "<leader>gD", function()
		vscode.action("editor.action.goToDefinition")
	end, { desc = "Goto Definition" })

	vim.keymap.set("n", "<leader>gI", function()
		vscode.action("editor.action.goToImplementation")
	end, { desc = "Goto Implementation" })

	vim.keymap.set("n", "<leader>gr", function()
		vscode.action("editor.action.goToReferences")
	end, { desc = "Goto References" })
else
	local preview = require("goto-preview")

	vim.keymap.set("n", "gpd", preview.goto_preview_definition, { desc = "Preview definition" })

	vim.keymap.set("n", "gpt", preview.goto_preview_type_definition, { desc = "Preview type definition" })

	vim.keymap.set("n", "gpi", preview.goto_preview_implementation, { desc = "Preview implementation" })

	vim.keymap.set("n", "gpD", preview.goto_preview_declaration, { desc = "Preview declaration" })

	vim.keymap.set("n", "gpP", preview.close_all_win, { desc = "Close all preview windows" })

	vim.keymap.set("n", "gpr", preview.goto_preview_references, { desc = "Preview references" })

	vim.keymap.set("n", "gp", "<Nop>", { noremap = true, silent = true })

	vim.keymap.set("n", "gP", "<Nop>", { noremap = true, silent = true })

	vim.keymap.set("v", "gp", "<Nop>", { noremap = true, silent = true })

	vim.keymap.set("v", "gP", "<Nop>", { noremap = true, silent = true })

	vim.keymap.set("n", "<Esc>", function()
		require("noice").cmd("dismiss")
		vim.cmd("nohlsearch")
	end, { silent = true, desc = "Dismiss noice & clear search highlight" })
end
