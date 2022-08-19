local vim = vim

-- Bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local function setup(name)
  return string.format('require("setup/%s")', name)
end

-- Plugin loading

return require('packer').startup(function(use)

	use {'wbthomason/packer.nvim'}

	use {'nvim-lua/plenary.nvim'}
	use {'kyazdani42/nvim-web-devicons'}

	use {'kyazdani42/nvim-tree.lua', config = setup('nvim-tree')}
	use {'nvim-telescope/telescope.nvim'}

	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/nvim-cmp', requires = {'hrsh7th/cmp-nvim-lsp', 'saadparwaiz1/cmp_luasnip'}, config = setup('nvim-cmp')}
	use {'L3MON4D3/LuaSnip'}
	use {'williamboman/mason.nvim', requires = {'williamboman/mason-lspconfig.nvim'}, config = setup('mason')}
	use {'nvim-treesitter/nvim-treesitter', config = setup('treesitter')}

	use {"lukas-reineke/indent-blankline.nvim", config = setup('indent-blankline')}

	use {'mattn/emmet-vim'}
	use {'ap/vim-css-color'}

	use {'nvim-lualine/lualine.nvim', requires = {'arkav/lualine-lsp-progress'}, config = setup('lualine')}

	use {'andweeb/presence.nvim'}

	if packer_bootstrap then
		require('packer').sync()
	end

end)
