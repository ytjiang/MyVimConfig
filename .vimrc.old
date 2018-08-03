"###############################################
"# VIM configuration file
"###############################################

"use VIM settings, rather than VI settings
set nocompatible

"display line number
set nu

"keep 50 command lines history
set history=50

"syntax highlight
syntax enable
syntax on

"display real information of cursor
set ruler
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %31\ %c\ %p%%%)

"display incomplete commands
set showcmd

"higtlight search
set hlsearch 
"incremental search, highlight every character when input
set incsearch

"parenthesis highlight matching
set showmatch

"always display status line(last line)
set laststatus=2

"disable mouse
set mouse= 

"indent settings
set ts=4
set sw=4
set expandtab
set cindent
set smartindent

filetype indent on
autocmd FileType python setlocal et sta sw=4 sts=4

"""""""""""""""""""""""
" set tags for different projects
"""""""""""""""""""""""
" project : ossec-hids, C
set tags=/Users/ytjiang/Documents/GitHub/ossec-hids/tags
" project : Unity, test framework for C, C
set tags+=/Users/ytjiang/Documents/GitHub/Unity/src/tags
" project : requests, python
set tags+=/Users/ytjiang/Documents/GitHub/requests/tags 
" project : scrapy, scawler module, python
set tags+=/Users/ytjiang/Documents/GitHub/scrapy/tags
" project : flask
set tags+=/Users/ytjiang/Documents/GitHub/flask/tags

"""""""""""""""""""""""
" auto add Python header -START
"""""""""""""""""""""""
autocmd BufNewFile *.py 0r ~/.templates/python_header
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
    if line("$") > 11
        let l = 12
    else
        let l = line("$")
    endif
    exe "1," . l . "g/File Name : .*/s/File Name : .*/File Name : " .expand("%")
endfun

fun CreatedTime()
    if line("$") > 11
        let l = 12
    else
        let l = line("$")
    endif
exe "1," . l . "g/Created Time : .*/s/Created Time : .*/Created Time : " .strftime("%Y-%m-%d %T")
endfun
"""""""""""""""""""""""
" auto add Python header -END
"""""""""""""""""""""""

"""""""""""""""""""""""
" tool : pydiction
"""""""""""""""""""""""
filetype plugin on
let g:pydiction_location = '/Users/ytjiang/.vim/complete-dict' 
