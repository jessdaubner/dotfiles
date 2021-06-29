call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'hynek/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-vinegar'

" Add plugins to &runtimepath and initialize plugin system
call plug#end()

colo seoul256
set background=dark
set number                 "show line numbers
set hlsearch               "highlight searches; noh command turns off
set ignorecase             "ignore case when searching
syntax on                  "turn syntax highlighting on by default
filetype on                "detect type of file
filetype indent on         "load indent file for specific file type
set ai                     "set auto-indenting for programming
set shiftwidth=4           "set indent/tab to be four spaces

" Map toggle to display invisible characters
" Recall: backslash is the default leader
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" cabbrev:
ca te tabedit
ca tn tabnew
ca th tabp
ca tl tabn

# Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
