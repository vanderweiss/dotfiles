require('nvim-treesitter.configs').setup {
	ensure_installed = {'bash', 'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua', 'python', 'sql', 'yaml'},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true
	}
}
