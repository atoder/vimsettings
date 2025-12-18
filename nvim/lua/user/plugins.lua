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
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup({
        silence_scp_warning = true,  -- No more scp warnings!

        -- Better defaults for remote editing
        view_options = {
          show_hidden = true,
        },

        -- Float preview for remote files
        float = {
          padding = 2,
          max_width = 120,
          max_height = 30,
        },
      })
    end,
  }

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {}
      vim.g.skip_ts_context_commentstring_module = true
    end
  }
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim"
  use "folke/which-key.nvim"
  use "ntpeters/vim-better-whitespace"
  use "nvimdev/zephyr-nvim"
  use 'LunarVim/darkplus.nvim'
  use "arzg/vim-colors-xcode"
  use { "metalelf0/jellybeans-nvim", requires = "rktjmp/lush.nvim" }
  use "sainnhe/sonokai"
  use 'bluz71/vim-moonfly-colors'
  use "lunarvim/synthwave84.nvim"
  use "olimorris/onedarkpro.nvim"
  use "EdenEast/nightfox.nvim"
  use "mcchrish/zenbones.nvim"
  use "luisiacc/gruvbox-baby"
  use 'Rigellute/shades-of-purple.vim'
  use 'sainnhe/edge'
  use 'Shatur/neovim-ayu'
  use 'humanoid-colors/vim-humanoid-colorscheme'
  use 'lissatransborda/dalton-vim'
  use { "ellisonleao/gruvbox.nvim" }
  use {'aktersnurra/no-clown-fiesta.nvim'}
  use "rebelot/kanagawa.nvim"
  use 'wuelnerdotexe/vim-enfocado'
  use 'sainnhe/gruvbox-material'
  use 'elsuizo/monosvkem'
  use 'srcery-colors/srcery-vim'
  use { 'embark-theme/vim', as = 'embark' }
  use 'sjl/badwolf'
  use 'rafalbromirski/vim-aurora'
  use 'vv9k/bogster'
  use 'AlessandroYorba/Alduin'
  use 'markhinch/vim-buddy'
  use 'bignimbus/pop-punk.vim'
  use 'elianiva/gruvy.nvim'
  use 'NTBBloodbath/doom-one.nvim'
  use 'fenetikm/falcon'
  use 'ajmwagar/vim-deus'
  use 'wimstefan/vim-artesanal'
  use 'Rigellute/rigel'
  use 'Softmotions/vim-dark-frost-theme'
  use 'tanvirtin/monokai.nvim'
  use 'cranberry-clockworks/mirror.nvim'
  use 's-janjic/gruber-darker-nvim'
  use 'Yazeed1s/oh-lucy.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'Mofiqul/dracula.nvim'
  use 'challenger-deep-theme/vim'
  use 'LunarVim/horizon.nvim'
  use 'noahfrederick/vim-noctu'
  use 'rktjmp/lush.nvim'
  use 'Hierosme/darcula.nvim'
  use "tjdevries/colorbuddy.nvim"
  use 'rbgrouleff/bclose.vim'
  use 'francoiscabrol/ranger.vim'
  use 'Exafunction/codeium.vim'
  use 'xolox/vim-colorscheme-switcher'
  use 'xolox/vim-misc'
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-nvim-lsp"

  -- track coding time
  -- use 'wakatime/vim-wakatime'


  vim.g.codeium_enabled = false
  vim.g.ranger_map_keys = 0

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
      require('distant'):setup()
    end
  }

  use {
    'MeanderingProgrammer/render-markdown.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup({
        latex = {
          enabled = true,
        }
      })
    end
  }
  use {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        layout = {
          default_direction = "right",
          width = 30,
        }
      })
    end
  }
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use "neovim/pynvim"
  use "tamago324/nlsp-settings.nvim"
  use "nvimtools/none-ls.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "BurntSushi/ripgrep"
  use "lewis6991/gitsigns.nvim"
  use 'tpope/vim-fugitive'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use { "nvim-neotest/nvim-nio" }
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {'mfussenegger/nvim-dap'},
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }

  -- Move all DAP setup to after plugins load
  vim.defer_fn(function()
    require("dapui").setup()

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    dap.adapters.codelldb = {
      type = 'server',
      host = '127.0.0.1',
      port = 13000
    }

    dap.configurations.c = {
      {
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
        end,
        cwd = '${workspaceFolder}',
        terminal = 'integrated'
      }
    }

    dap.configurations.cpp = dap.configurations.c
    dap.configurations.rust = dap.configurations.c
  end, 100)



  use 'mhinz/vim-startify'
  use 'kopischke/vim-stay'
  use { 'alexghergh/nvim-tmux-navigation', config = function()
    require'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true
    }
    vim.api.nvim_set_keymap('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
  end
  }
  -- Rooter: MINIMAL MODIFICATION
  use {
    'jedi2610/nvim-rooter.lua',
    config = function()
      require'nvim-rooter'.setup {
        disable_on = function()
          local bufname = vim.api.nvim_buf_get_name(0)
          return bufname:match("^oil-ssh://") or bufname:match("^scp://") or bufname:match("^sftp://")
        end
      }
    end
  }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
