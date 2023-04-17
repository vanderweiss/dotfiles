vim.diagnostic.config {
	signs = false,
	update_in_insert = false,
	virtual_text = false	
}

local lsp_flags = {debounce_text_changes = 150,}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local servers = {
	'bashls',
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

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
	flags = lsp_flags,
	root_dir = function(fname)
		return vim.loop.cwd()
	end,
	}
end

lspconfig['sumneko_lua'].setup {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
				disable = {
					'lowercase-global',
					'undefined-global',
					'unused-local',
					'trailing-space'
				}
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true)
			},
			telemetry = {
				enable = false
			}
		}
	}
} 
