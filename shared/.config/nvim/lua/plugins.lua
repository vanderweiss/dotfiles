-- Setup

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_boostrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Plugin loading

local function setup(plugin)
	return string.format("require('setup/%s')", plugin)
end

return require('packer').startup(function(use) 

	-- Packer manages itself

	use 'wbthomason/packer.nvim'

	-- Plugins

	use 'nvim-lua/plenary.nvim'						

	use {
		'neovim/nvim-lspconfig',
		config = setup('nvim-lspconfig')
	}

	use {
		'williamboman/mason.nvim',
		config = setup('mason'),
		requires = {
			'williamboman/mason-lspconfig.nvim'
		}
	}

	use {
		'hrsh7th/nvim-cmp',
		config = setup('nvim-cmp'),
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip'
		}
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = setup('nvim-treesitter')
	}

	use {
		'nvim-lualine/lualine.nvim',
		config = setup('lualine')
	}

	use 'lukas-reineke/indent-blankline.nvim'	
	use 'mattn/emmet-vim'	

	use {
		'norcalli/nvim-colorizer.lua',
		config = setup('nvim-colorizer')
	}	

	use {
		'xiyaowong/nvim-transparent',
		config = setup('nvim-transparent')
	}

	use 'rktjmp/lush.nvim'
	use 'kabouzeid/nvim-jellybeans'
		
	-- Bootstrapping

	if packer_bootstrap then
		require('packer').sync()
	end
end)
