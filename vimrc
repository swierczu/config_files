set encoding=utf-8
syntax on
set nocompatible
set ruler
set backup
set backupdir=~/.vim/backup
"set smartindent
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set hlsearch
set incsearch
set ignorecase              " during searching
"set foldmethod=indent 
set wildmode=longest,list
set wildmenu
set shellslash
set grepprg=grep\ -nH\ $*
"set cmdheight=2             " height commandline
set history=50
set mousemodel=popup
filetype plugin indent on
set spelllang=pl,en
set nospell

"omnicompletition:
set completeopt=preview,menuone

if has("gui_gtk2")
"    set guifont=Bitstream\ Vera\ Sans\ Mono\ 8
    set guifont=Liberation\ Mono\ 12
endif

if has("gui_running")
    colorscheme evening
else
    "colorscheme default
    colorscheme evening
endif

" Taglist
noremap <silent> <F11> :Tlist<cr>

" Write, make and show errors
noremap <silent> <F9>  :w<cr>:!make<cr>:cwindow<cr>

" Detect passwd file and colorized
augroup filetypedetect
au BufNewFile,BufRead passwd setf passwd
augroup END

" vimtags:
if has("gui_running")
    let Tlist_Show_Menu=1
endif
let Tlist_Exit_OnlyWindow=1
let Tlist_Enable_Fold_Column=0

" vimspell:
highlight SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse
