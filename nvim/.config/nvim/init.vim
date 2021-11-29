set path+=**
set hidden

set expandtab
set shiftwidth=2
set tabstop=2

set colorcolumn=120
colorscheme smyck
set background=dark

set number
highlight clear SignColumn
set signcolumn=yes

set smartcase

set list
set listchars=tab:▸\ ,trail:·

set scrolloff=8
set sidescrolloff=8

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'

Plug 'airblade/vim-gitgutter'
" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Ruby
Plug 'andrewradev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/tagalong.vim'

" Tests
Plug 'vim-test/vim-test'

" Man pages from vim
Plug 'vim-utils/vim-man'

" RFCs from vim
Plug 'mhinz/vim-rfc'

" Kbd Chords
Plug 'kana/vim-arpeggio'

" Formatter
Plug 'sbdchd/neoformat'

" LSP
Plug 'neovim/nvim-lspconfig'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

"
Plug 'tomtom/tcomment_vim'

Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'vim-ruby/vim-ruby'

"Theme
Plug 'fcpg/vim-orbital'
Plug 'jpo/vim-railscasts-theme'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Initialize plugin system
call plug#end()

nnoremap <C-p> :FZF!<Cr>

" Arpeggio inoremap jk  <Esc>
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

let mapleader = " "
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
" xnoremap <leader>p "_dP
nmap <Leader>p cw<C-r>0

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" test.vim mappings
map <Leader>n :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>l :TestLast<CR>
map <Leader>tb :TestVisit<CR>

" vim-fugivituve
nmap <Leader>gs :G<CR>
nmap <Leader>f :diffget //2<CR>
nmap <Leader>j :diffget //3<CR>

" vim-rails
nmap <Leader>a :R<CR>
nmap <Leader>m :Tmodel <CR>
nmap <Leader>c :Tcontroller<CR>
nmap <Leader>v :Tview<CR>

nmap <Leader>r :!bundle exec rubocop %<CR>
nmap <Leader>s :Rg <C-r><C-w><CR>

" other
nmap <Leader><Space> :w<CR>
nmap <Leader>x :bd<CR>


" Harpoon
nmap <Leader>. :lua require("harpoon.mark").add_file()<CR>
nmap <Leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nmap <Leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nmap <Leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nmap <Leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nmap <Leader>, :lua require("harpoon.ui").toggle_quick_menu()<CR>

" Configurations and stuffs
nmap <Leader>vc :e ~/.config/nvim/init.vim<CR>
nmap <Leader>vz :e ~/.zshrc<CR>

" Macros
let @r = "Obinding.remote_pry"
let @d = "Obinding.pry"
let @p = "ywOputs \"\"Pbea: pbi#{ea}"

" Must haves
nnoremap Y yg_
" Keeps cursor center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap { {<c-g>u
inoremap [ [<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

" Moving lines in visual mode 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" super replace
nnoremap cn *``cgn
nnoremap cN *``cgN

lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
	on_attach = on_attach,
	flags = {
	  debounce_text_changes = 150,
	}
  }
end
EOF

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   highlight = {
"     enable = true,
"     custom_captures = {
"       -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
"       ["foo.bar"] = "Identifier",
"     },
"     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"     -- Using this option may slow down your editor, and you may see some duplicate highlights.
"     -- Instead of true it can also be a list of languages
"     additional_vim_regex_highlighting = false,
"   },
" }
" EOF
