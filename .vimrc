set nocompatible
set nobackup
set noundofile
set rtp+=:~/.vim
set wrap linebreak nolist
set formatoptions=l

set ruler

inoremap jk <ESC>
vnoremap jk <ESC>
syntax on
set autoindent

set sts=4
set sw=4

set expandtab

set mouse=a

set ruler
set rulerformat=%40(%y/%{&fenc}/%{&ff}%=%l,%c%V%5(%P%)%)
set number

set incsearch
set ignorecase
set smartcase

set list
set backspace=2
set synmaxcol=316

set history=1000
set wildmenu

set nolist nowrap linebreak breakat&vim

autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") |
    \ exe "normal `\"" | endif

set spelllang=pl,en
    
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

syntax enable


set omnifunc=syntaxcomplete#Complete

" Konfiguracja z wiki
" https://pl.wikibooks.org/wiki/Vim/Konfiguracja

"scriptencoding utf-8
set encoding=utf-8
set fileencodings=usc-bom,utf-8,latin2
set termencoding=utf-8

if has("autocmd")
     autocmd BufEnter * :cd %:p:h
 endif " has("autocmd")
 

call pathogen#infect()
call pathogen#helptags()
filetype plugin on
filetype indent on
set foldlevelstart=10

set t_Co=256
set colorcolumn=80
autocmd FileType text set colorcolumn=0 | set wrap 

if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
    colorscheme zenburn
    set langmenu=en_US
    let $LANG = 'en_US'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    let vimrplugin_r_path = 'C:\Program Files\R\R-3.3.0\bin\x64'
else
    colorscheme obsidian 
    let vimrplugin_r_path = 'C:\Program Files\R\R-3.3.0\bin\x64'
    inoremap <Nul> <C-x><C-o>
endif

" Python settings
" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch
set laststatus=2

" enable all Python syntax highlighting features
let python_highlight_all = 1

