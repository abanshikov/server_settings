call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'morhetz/gruvbox'
Plug 'chun-yang/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
call plug#end()
set nocompatible
set showcmd
set hlsearch
set incsearch
colorscheme gruvbox
set background=dark
set tabstop:4
set shiftwidth:4
set smarttab
set expandtab
set softtabstop=4
set showtabline=0
set autoindent
let python_highlight_all = 1
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
syntax on
set nu
set mousehide
set mouse=a
set termencoding=utf-8
set wrap
set linebreak
set nobackup
set noswapfile
set encoding=utf-8
inoremap jj <Esc>
inoremap оо <Esc>
nnoremap ; :
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>l
vnoremap <c-s> <Esc>:w<CR>
nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-j> gT
nnoremap <C-k> gt
map <C-b> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
