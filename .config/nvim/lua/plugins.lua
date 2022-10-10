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
	use 'kyazdani42/nvim-web-devicons'

	use {
		'kyazdani42/nvim-tree.lua', 
		config = setup('nvim-tree')
	}				
	
	use {
		'nvim-telescope/telescope.nvim',
		config = setup('telescope')
	}		

	use {
		'neovim/nvim-lspconfig',
		config = setup('nvim-lspconfig')
	}

	use {
		'hrsh7th/nvim-cmp',
		config = setup('nvim-cmp')
	}

	use 'hrsh7th/cmp-nvim-lsp'					
	use 'L3MON4D3/LuaSnip'						
	use 'saadparwaiz1/cmp_luasnip'	
	use 'williamboman/mason-lspconfig.nvim'

	use {
		'williamboman/mason.nvim',
		config = setup('mason')
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = setup('nvim-treesitter')
	}

	use 'lukas-reineke/indent-blankline.nvim'	
	use 'mattn/emmet-vim'	

	use {
		'norcalli/nvim-colorizer.lua',
		config = setup('nvim-colorizer')
	}	

	use {
		'akinsho/bufferline.nvim',
		config = setup('bufferline'),
		disable = true
	}

	use {
		'nvim-lualine/lualine.nvim',
		config = setup('lualine')
	}

	use 'arkav/lualine-lsp-progress'
	
	use {
		'andweeb/presence.nvim',
		config = setup('presence')
	}
	
	use {
		'xiyaowong/nvim-transparent', 
		config = setup('nvim-transparent')
	}

	-- Colorschemes

	use {
		'ishan9299/modus-theme-vim',
		config = setup('modus-theme-vim'),
		disable = true
	}

	use {
		'marko-cerovac/material.nvim',
		config = setup('material')
	}
		
	-- Bootstrapping

	if packer_bootstrap then
		require('packer').sync()
	end
end)
