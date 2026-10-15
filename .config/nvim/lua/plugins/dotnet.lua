return {
	{
		"mason-org/mason.nvim",
		opts = { ensure_installed = { "roslyn-language-server" } },
	},

	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			-- Roslyn on nvim 0.12 emits inlay-hint columns past end-of-line, which
			-- crashes the inlay-hint renderer ("Invalid 'col': out of range").
			-- Disable server-side inlay hints so no bad extmarks are produced.
			settings = {
				["csharp|inlay_hints"] = {
					csharp_enable_inlay_hints_for_implicit_object_creation = false,
					csharp_enable_inlay_hints_for_implicit_variable_types = false,
					csharp_enable_inlay_hints_for_lambda_parameter_types = false,
					csharp_enable_inlay_hints_for_types = false,
					dotnet_enable_inlay_hints_for_indexer_parameters = false,
					dotnet_enable_inlay_hints_for_literal_parameters = false,
					dotnet_enable_inlay_hints_for_object_creation_parameters = false,
					dotnet_enable_inlay_hints_for_other_parameters = false,
					dotnet_enable_inlay_hints_for_parameters = false,
					dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
					dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
					dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
				},
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				omnisharp = { enabled = false },
			},
		},
	},
}
