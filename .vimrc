"======================================
" Configurations
"======================================
" Use Vim settings, rather than Vi settings " This must be first, because it changes other options as a side effect
set nocompatible
set modeline

syntax on " enable syntax highlighting
filetype on " enable filetype detection
filetype plugin on


" Use pathogen!
execute pathogen#infect()

"Fix problems with the 'delete' key, so that it deletes characters after the
"cursor instead of before the cursor
fixdel

set number " show line number
" set cc=80 " color columns > 80 characters
set title " show title in window console

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set hlsearch " highlight search results (use :noh to remove highlights)

" Set tab width to 4, and use expandtab to use spaces for tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Turn on smart indenting (helps for C-like languages):
set smartindent

" Enable pyflakes for simple python error-checking:
let g:pyflakes_use_quickfix = 0 " Prevent pyflakes from using quickfix window

" Colors!
"if $COLORTERM == 'gnome-terminal'
"  set t_Co=256
"endif

"======================================
" Autocommands
"======================================
" Only do this part when compiled with support for autocommands.
if has("autocmd") && !exists("has_loaded_autocommands")
    " Create variable to check whether autocommands have been loaded yet
    let has_loaded_autocommands = 1

    " Prevent smartindent for python files
    autocmd FileType python set nosmartindent

    filetype plugin indent on " enable loading indent file for filetype

    " Automatically remove all trailing whitespace:
    autocmd BufWritePre * :%s/\s\+$//e

    " Enable pylint for more detailed python violations:
    autocmd FileType python compiler pylint
    let g:pylint_onwrite = 0

    " Make default html file-teype djangohtml to support django syntax highlighting
    autocmd BufRead,BufNewFile *.html set filetype=htmldjango

    " Make vim automatically source (i.e., reload) the vimrc each time it is saved
    autocmd bufwritepost .vimrc source $MYVIMRC

else
    set autoindent
endif

"======================================
" Plugin Settings
"======================================

"NERDTREE
let NERDTreeIgnore = ['\.pyc$', '\.DS_Store$']
nnoremap <C-e> :NERDTreeToggle<CR>

"======================================
" Keymappings and commands
"======================================
" Set pastetoggle so that when on, pasting preserves indentation from text
" copied from external applications:
set pastetoggle=<F12>

" Map F5 and F6 keys to previous and next tabs:
map <C-p> :tabp<CR>
map <C-n> :tabn<CR>

" CDC = Change to Directory of Current file
if !exists(":CDC")
    command CDC cd %:p:h
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"======================================
" File configuration
"======================================
"Change temp file locations:
set backup "Turn on backup files
set backupdir=~/.vim/tmp "Set location to store backups
set dir=~/.vim/tmp "Set where to store swap files

