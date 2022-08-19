require('lualine').setup {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'horizon'
	},
	sections = {
		lualine_c = {
			'filename',
			'lsp_progress'
		},
	},
	extensions = {'nvim-tree'}
}
