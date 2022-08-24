local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "arzg/vim-colors-xcode"
  use "sainnhe/everforest"
  use { "metalelf0/jellybeans-nvim", requires = "rktjmp/lush.nvim" }
  use "sainnhe/sonokai"
  use "ray-x/starry.nvim"
  use 'bluz71/vim-moonfly-colors'
  use "projekt0n/github-nvim-theme"
  -- use "lunarvim/synthwave84.nvim"  -- looks cool with Comic Mono theme
  use "olimorris/onedarkpro.nvim"

  -- random colorscheme picker - picks automatically
  use 'xolox/vim-colorscheme-switcher'
  use 'xolox/vim-misc'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- A tree like view for symbols in Neovim using the Language Server Protocol.
  -- Supports all your favourite languages.
  -- :SymbolsOutline
  use "simrat39/symbols-outline.nvim"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "BurntSushi/ripgrep"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- another git tool
  use 'tpope/vim-fugitive'

  -- A fancy start screen for Vim.
  -- Also can save sessions
  -- :h SSave to see help screen
  -- sessions get stored into:
  -- Vim (Unix):    `$HOME/.vim/session`
  -- :SLoad       load a session
  -- :SSave[!]    save a session
  -- :SDelete[!]  delete a session
  -- :SClose      close a session
  use 'mhinz/vim-startify'

  -- Vim Better Whitespace Plug
  -- :ToggleWhitespace
  -- :StripWhitespace
  -- use 'ntpeters/vim-better-whitespace'

  -- FastFold integrates with the plug-in vim-stay that restores the folds of
  -- a file buffer by :mkview and :loadview.
  use 'kopischke/vim-stay'

  -- Easily interact with tmux from vim
  use { 'alexghergh/nvim-tmux-navigation', config = function()
    require'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true -- defaults to false
    }

    vim.api.nvim_set_keymap('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
  end
  }

  -- A high performance plugin to change your working directory to the project
  -- root when you open a file. Basically a minimal version of vim-rooter
  -- written in lua.
  -- Use :RooterToggle
  use {
    'jedi2610/nvim-rooter.lua',
    config = function() require'nvim-rooter'.setup() end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
