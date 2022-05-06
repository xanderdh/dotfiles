call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"javascript
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax

"Code
Plug 'sheerun/vim-polyglot' "Syntax
Plug 'preservim/nerdcommenter' "Comment

"colorschema
Plug 'morhetz/gruvbox'

call plug#end()
