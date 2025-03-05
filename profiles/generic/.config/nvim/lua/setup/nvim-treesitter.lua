require('nvim-treesitter.configs').setup {

  ensure_installed = { 
	  'bash',
	  'c',
	  'css',
	  'cuda',
	  'cpp',
	  'html',
	  'json',
	  'javascript',
	  'lua',
	  'python',
	  'rust',
	  'toml'
  },

  sync_install = true,
  auto_install = true,
  ignore_install = {},

  highlight = {

    enable = true,
    disable = {},

    additional_vim_regex_highlighting = false,
  },
}
