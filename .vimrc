execute pathogen#infect()
filetype plugin indent on

syntax on
syntax on
colorscheme darkblue
filetype plugin indent on

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

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

cnoremap <C-a> <home>
cnoremap <C-e> <end>

nnoremap <leader>V V']
