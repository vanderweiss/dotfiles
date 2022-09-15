require('lualine').setup {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'auto'
	},
	sections = {
		lualine_b = {
			'branch',  
			{
				'diagnostics',
				sources = {'nvim_lsp', 'nvim_diagnostic'},
				sections = {'error', 'warn', 'info', 'hint'},
				diagnostics_color = { 
					error = 'DiagnosticError',
					warn  = 'DiagnosticWarn', 
					info  = 'DiagnosticInfo', 
					hint  = 'DiagnosticHint', 
				},
				symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
				--symbols = {error = ' ', warn = '', info = ' ', hint = ' '},
				colored = true,
				update_in_insert = false,
				always_visible = false
			}
		},
		lualine_c = {
			'filename',
			{
				'lsp_progress',
				display_components = { 'lsp_client_name', { 'title', 'percentage', 'message' },},
				separators = {
					component = ' ',
					progress = ' | ',
					percentage = { pre = '', post = '%% ' },
					title = { pre = '', post = ': ' },
					lsp_client_name = { pre = '[', post = ']' },
					message = { commenced = 'In Progress', completed = 'Completed' },
				},
				timer = { progress_enddelay = 500, lsp_client_name_enddelay = 1000 },
			}
		},
	},
	extensions = {'nvim-tree'},
}
