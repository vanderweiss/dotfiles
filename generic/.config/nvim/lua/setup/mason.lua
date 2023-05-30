require('mason').setup {
    ui = {
        icons = {
            package_installed = '*',
            package_pending = '!',
            package_uninstalled = '-'
        }
    }
}

require('mason-lspconfig').setup {
    automatic_installation = true,
	ensure_installed = {
		'cssls',
		'cmake',
		'clangd',
		--'hls',
		'html',
		'jsonls',
		'lua_ls',
		'pyright',
		'sqlls',
		'rust_analyzer',
		'tsserver',
		'yamlls'
	}
}
