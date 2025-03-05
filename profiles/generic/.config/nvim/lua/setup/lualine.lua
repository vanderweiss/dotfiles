require('lualine').setup {
	options = {
		theme = 'auto',
		globalstatus = true, 
		icons_enabled = false,
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' }
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'encoding'},
		lualine_y = {'progress'},
		lualine_z = {'location'},
	}
}
