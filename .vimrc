"======================================
" Configurations
"======================================
" Use Vim settings, rather than Vi settings " This must be first, because it changes other options as a side effect.
set nocompatible
set modeline


" Use pathogen!
execute pathogen#infect()
execute pathogen#helptags()
syntax on " enable syntax highlighting
filetype plugin indent on

"Fix problems with the 'delete' key, so that it deletes characters after the
"cursor instead of before the cursor
fixdel

set number " show line number
set cc=120 " color columns > 80 characters
"set title " show title in window console

" So much status
"statusline setup
set statusline=%1*      " set status line color
set statusline+=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

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

    " Automatically remove all trailing whitespace:
    autocmd BufWritePre * :%s/\s\+$//e

    " Make vim automatically source (i.e., reload) the vimrc each time it is saved
    autocmd bufwritepost .vimrc source $MYVIMRC

else
    set autoindent
endif

"======================================
" Plugin Settings
"======================================
"pymode configs
let g:pymode_lint = 0


"======================================
" Keymappings and commands
"======================================
" Set pastetoggle so that when on, pasting preserves indentation from text
" copied from external applications:
set pastetoggle=<C-l>

" Map keys to previous and next tabs:
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

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

"======================================
" File configuration
"======================================
"Change temp file locations:
set backup "Turn on backup files
set backupdir=~/.vim/tmp "Set location to store backups
set dir=~/.vim/tmp "Set where to store swap files
