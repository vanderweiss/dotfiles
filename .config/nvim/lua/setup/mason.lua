require('mason').setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = 'X'
        }
    }
}

require('mason-lspconfig').setup {
    automatic_installation = true,
	ensure_installed = {
		'cssls',
		'cmake',
		'clangd',
		'html',
		'jsonls',
		'pyright',
		'sumneko_lua',
		'sqlls',
		'rust_analyzer',
		'tsserver',
		'yamlls'
	}
}
