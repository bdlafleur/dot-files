execute pathogen#infect()

" For proper filetype highlighting.
filetype plugin indent on
syntax on

"syntax enable

" For flake8'ing my python files.
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']

" For my color scheme.
colorscheme srcery

" Leader for custom namespace commands (not used yet).
let mapleader =","

" Basic settings.
set autoindent
set cursorline
set colorcolumn=80
set number
set history=1000
set wildmenu
set mouse=a
set hlsearch

" Basic spacing settings.
set textwidth=80
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set tw=0

" IDE Emulator.
map <C-y> :TagbarToggle<CR>
map <C-t> :NERDTreeToggle<CR>

" For regular window swiching in vim.
map <C-J> <C-w>j
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-K> <C-W>k

" Cancel current search/highlight command.
map <C-_> :let @/=""<CR>

" On search, don't go to next keyword.
map * *<C-o>

" Quick resizing of window sizes.
noremap <C-left> 5<C-w><
noremap <C-right> 5<C-w>>
noremap <C-up> 5<C-w>+
noremap <C-down> 5<C-w>-

" Switch between buffers
map <S-k> :bp<CR>
map <S-j> :bn<CR>

" Add for vera auto completion
"so /home/blafleur/.vim/scripts.vim
"so /home/blafleur/.vim/ftplugin/verainput.vim
"so /home/blafleur/.vim/autoload/verainputcomplete.vim

" So I don't have to type as much
command! PQ call Embed()
function! Embed()
   normal! Ofrom IPython import embed; embed()
endfunction
