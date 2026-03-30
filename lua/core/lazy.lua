-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

lazy.setup({
  spec = {
    -- Colorscheme: Catppuccin
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      lazy = false,
      priority = 1000,
    },

    -- Icons
    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Git signs in gutter
    {
      'lewis6991/gitsigns.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function()
        require('gitsigns').setup {
          current_line_blame = true,
          current_line_blame_opts = { delay = 500 },
        }
      end
    },

    -- File explorer
    {
      'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Statusline (lualine replaces feline)
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Bufferline (tab-like buffer bar)
    {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Telescope (fuzzy finder)
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Which-key (keybinding hints)
    {
      'folke/which-key.nvim',
      event = 'VeryLazy',
    },

    -- Todo comments highlighting
    {
      'folke/todo-comments.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('todo-comments').setup{}
      end
    },

    -- Noice (better UI for messages, cmdline, popups)
    {
      'folke/noice.nvim',
      event = 'VeryLazy',
      dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
      },
    },

    -- Surround (ys, cs, ds motions)
    {
      'kylechui/nvim-surround',
      version = "*",
      event = 'VeryLazy',
      config = function()
        require('nvim-surround').setup{}
      end
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- WakaTime
    {
     "wakatime/vim-wakatime",
     lazy = false,
    },

    -- LSP
    { 'neovim/nvim-lspconfig' },

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',
      },
    },
  },
})
