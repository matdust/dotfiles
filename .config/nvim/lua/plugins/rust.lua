return {
	{
		"mrcjkb/rustaceanvim",
		lazy = false,
		version = "^6",
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				server = {},
				dap = {},
			}
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = true,
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		opts = function()
			local dap = require("dap")

			-- Ensure codelldb adapter is registered
			if not dap.adapters.codelldb then
				dap.adapters.codelldb = {
					type = "server",
					port = "${port}",
					executable = {
						command = vim.fn.exepath("codelldb"),
						args = { "--port", "${port}" },
					},
				}
			end

			-- Add "attach to process" configuration for Rust
			dap.configurations.rust = dap.configurations.rust or {}
			table.insert(dap.configurations.rust, {
				name = "Attach to process",
				type = "codelldb",
				request = "attach",
				pid = require("dap.utils").pick_process,
				args = {},
			})
		end,
		-- stylua: ignore
		keys = {
			{ "<leader>dK", function()
				require("dap").run({
					name = "Attach to process",
					type = "codelldb",
					request = "attach",
					pid = require("dap.utils").pick_process,
				})
			end, ft = "rust", desc = "Attach to Process (Rust)" },
		},
	},
}

