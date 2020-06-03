call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"javascript
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"colorschema
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark

let g:ctrlp_custom_ignore = 'node_modules\|git'

set number
set expandtab
set tabstop=2

syntax on
set spell spelllang=en_us
set hlsearch
set incsearch
set ignorecase

"coc
set hidden

"mappings
map <C-n> :NERDTreeToggle<CR>

