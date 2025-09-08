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
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons', -- optional, for file icons
  --   },
  --   tag = 'nightly' -- optional, updated every week. (see issue #1193)
  -- }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use 'JoosepAlviste/nvim-ts-context-commentstring'
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
  use "ntpeters/vim-better-whitespace" -- white space tool
  use "nvimdev/zephyr-nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use 'LunarVim/darkplus.nvim'
  use "arzg/vim-colors-xcode"
  use { "metalelf0/jellybeans-nvim", requires = "rktjmp/lush.nvim" }
  use "sainnhe/sonokai"
  use 'bluz71/vim-moonfly-colors'
  use "lunarvim/synthwave84.nvim"  -- looks cool with Comic Mono theme
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

  -- Ranger and dependencies
  use 'rbgrouleff/bclose.vim'
  use 'francoiscabrol/ranger.vim'
  -- disable default <leader>f mapping
  vim.g.ranger_map_keys = 0

  -- Github Co Pilot
  -- :Copilot setup
  -- :Copilot enable
  -- :help copilot
  -- use 'github/copilot.vim'
  -- vim.g.copilot_assume_mapped = true

  use 'Exafunction/codeium.vim'
  vim.g.codeium_enabled = false
  -- tab to insert suggestion
  -- Command + ] or [ to cycle
  -- Control + ] to clear suggestion
  -- call codeium#Chat() call chat

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


  use 'wakatime/vim-wakatime'

  -- A tree like view for symbols in Neovim using the Language Server Protocol.
  -- Supports all your favourite languages.
  -- :SymbolsOutline
  use "simrat39/symbols-outline.nvim"
  require("symbols-outline").setup()


  -- For "lukas-reineke/indent-blankline.nvim"

  -- Make nvim transparent
  -- use "xiyaowong/nvim-transparent"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  --[[ use "neovim/nvim-lspconfig" -- enable LSP ]]
  -- lsp-installer is not longer mainted, mason.nvim is the next generation
  --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Pynvim: Python client to Neovim
  use "neovim/pynvim"

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
  require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "javascript",
    "typescript",
    -- "jsx", -- REMOVED THIS LINE
    "lua",
    "vim",
    "html",
    "css",
    "java",
    "go",
    "cpp",
    "c",
    "python",
    "json",
    "yaml",
    "markdown",
    "bash",
    "rust"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

  require('ts_context_commentstring').setup {}
  vim.g.skip_ts_context_commentstring_module = true

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- another git tool
  use 'tpope/vim-fugitive'

  -- https://github.com/folke/trouble.nvim
  -- A pretty list for showing diagnostics, references, telescope results,
  -- quickfix and location lists to help you solve all the trouble your code is
  -- causing.
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Debugger
  -- A typical debug flow consists of:
  -- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
  -- Launching debug sessions and resuming execution via :lua require'dap'.continue().
  -- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
  -- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
  -- See :help dap.txt, :help dap-mapping and :help dap-api.
  -- https://github.com/mfussenegger/nvim-dap
  use { "nvim-neotest/nvim-nio" }
  use 'mfussenegger/nvim-dap'

  -- UI debugger This is still early stage software. Bugs are expected and
  -- there may be breaking changes!
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  require("dapui").setup()

  -- https://github.com/theHamsta/nvim-dap-virtual-text
  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {'mfussenegger/nvim-dap'}
  }

  require("nvim-dap-virtual-text").setup()

  -- start dap and dapui
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

  -- INFO: To get debugger working
  -- 1. execute ~/Downloads/vscode-extensions/codelldb/extension/adapter/codelldb --port 13000
  -- OR loop such as ~/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/adapter » while sleep 1; do ./codelldb --port 13000; done
  -- 2. Make sure the .cpp is compiled with debugging flags such as g++ -Wall -std=c++17 -g -O0 file.cpp
  -- 3. DevToolsSecurity --enable (if you don't want developer tools pop up each time)
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
      --program = '${fileDirname}/${fileBasenameNoExtension}',
      cwd = '${workspaceFolder}',
      terminal = 'integrated'
    }
  }

  dap.configurations.cpp = dap.configurations.c
  dap.configurations.rust = dap.configurations.c

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
