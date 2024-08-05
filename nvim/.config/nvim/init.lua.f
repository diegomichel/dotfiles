local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'


Plug('scrooloose/nerdtree', { ['on'] = 'NERDTreeToggle' })

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'
Plug('rdnetto/YCM-Generator', { ['branch'] = 'stable' })

-- Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
-- Plug 'junegunn/fzf.vim'

Plug 'andrewradev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/tagalong.vim'

Plug 'vim-test/vim-test'

Plug 'vim-utils/vim-man'

Plug 'mhinz/vim-rfc'

Plug 'kana/vim-arpeggio'

Plug 'sbdchd/neoformat'

Plug 'neovim/nvim-lspconfig'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'tomtom/tcomment_vim'

Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'vim-ruby/vim-ruby'

Plug 'fcpg/vim-orbital'
Plug 'jpo/vim-railscasts-theme'

Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

Plug 'https://github.com/tpope/vim-rbenv'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/preservim/vimux'

Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })


Plug 'MunifTanjim/nui.nvim'
Plug 'dpayne/CodeGPT.nvim'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'github/copilot.vim'

Plug 'tpope/vim-ragtag'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'elixir-editors/vim-elixir'

vim.call('plug#end')

local lspconfig = require('lspconfig')

require'lspconfig'.elixirls.setup{
    cmd = { "/usr/local/Cellar/elixir-ls/0.10.0/libexec/language_server.sh" };
}
require'lspconfig'.elixirls.setup{}
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
