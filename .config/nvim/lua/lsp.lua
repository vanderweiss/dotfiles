local vim = vim

vim.lsp.set_log_level("debug")

vim.diagnostic.config({
  virtual_text = false
})

vim.opt.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

local lsp_flags = {debounce_text_changes = 150,}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local servers = {
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
				version = 'LuaJIT'
			},
			diagnostics = {
				globals = {'vim'}
			}
		}
	}
}
