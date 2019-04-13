execute pathogen#infect()
filetype plugin indent on

syntax on
syntax on
colorscheme darkblue

let mapleader =","

set autoindent
set visualbell
set cursorline
set ruler
set number
set history=1000
set title
set linebreak
set wildmenu
set mouse=a
highlight ColorColumn ctermbg=gray

set textwidth=80
set colorcolumn=+1
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set tw=0

au FocusLost * :wa

map <F8> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
" For window switching within tmux.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" For regular window swiching in vim.
"map <C-J> <C-w>j
"map <C-H> <C-W>h
"map <C-L> <C-W>l
"map <C-K> <C-W>k
"map <C-_> :let @/=""<CR>
"map n nzz
"map N Nzz
map * *<C-o>

noremap <C-left> 5<C-w><
noremap <C-right> 5<C-w>>
noremap <C-up> 5<C-w>+
noremap <C-down> 5<C-w>-

" Switch between buffers
map <S-k> :bp<CR>
map <S-j> :bn<CR>

inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
noremap <C-a> ^
noremap <C-e> $

" Remove whitespace
noremap <F5> :%s/\s\+$//e<CR>

cnoremap <C-a> <home>
cnoremap <C-e> <end>

nnoremap <leader>V V']

" Added for vera auto completion
so /home/blafleur_local/.vim/scripts.vim
so /home/blafleur_local/.vim/ftplugin/verainput.vim
so /home/blafleur_local/.vim/autoload/verainputcomplete.vim
