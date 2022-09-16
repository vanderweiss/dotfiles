vim.lsp.set_log_level('debug')

vim.diagnostic.config {
	update_in_insert = false,
	virtual_text = false
}

--[[local diagnostic_signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(diagnostic_signs) do
	vim.fn.sign_define(sign.name, {
		texthl = sign.name,
		text = sign.text,
		numhl = sign.name,	
	})
end--]]

local signs = {
	Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus = false})]]

local lsp_flags = {debounce_text_changes = 150,}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local servers = {
	'bashls',
	'cssls',
    'cmake',
    'clangd',
	--'hls',
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
