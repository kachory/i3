"--[Configuration de Vim]--"

"-- Annule la compatibilité avec Vi
set nocompatible

"-- Shell
set shell=zsh
set term=rxvt-unicode

"-- Encodage des fichiers par défaut
set encoding=utf-8
set fileencoding=utf-8

"-- Fond transparent
function! AdaptColorscheme()
highlight clear CursorLine
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight NonText ctermbg=none
highlight SpecialKey ctermbg=none
highlight VertSplit ctermbg=none
highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()
 
"-- Syntaxe, affichage & Couleurs
syntax on
filetype on
filetype indent on
filetype plugin on
set title
set wrap
set scrolloff=3
set number
set showmode
set ruler
set background=dark
set laststatus=1
set t_Co=256
colorscheme desert256
set cmdheight=1
set hidden

"-- Recherche
set hlsearch
set incsearch
set ignorecase
set smartcase
set history=1000
set wrapscan

"-- Comportement
set backspace=indent,eol,start
set ffs=unix,dos,mac
set hidden
set textwidth=120
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set switchbuf=useopen,usetab
set showcmd
set ttyfast
augroup resCur
autocmd!
autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
au BufRead /tmp/mutt-* set tw=72

"-- Sons
set visualbell
set noerrorbells

"-- Attribution des touches
inoremap ;; <esc>
nnoremap <silent> <F9> :NERDTreeToggle<CR>
nnoremap <silent> <F10> :BufExplorer<CR>

"-- Souris
set mouse=a
