"###############################################
"# VIM configuration file
"# Author : Yuetao Jiang(jiangyuetao1987@gmail.com)
"# NT ID  : jiangy9
"###############################################

"use VIM settings, rather than VI settings
set nocompatible

"encoding
set encoding=utf-8

"display line number
set nu

"keep 50 command lines history
set history=50

set ic
set term=screen-256color

"syntax highlight
syntax enable
"use default syntax highlight
syntax on

"code fold
"set foldmethod=indent
set foldmethod=syntax
set nofoldenable

"""""""""""""""""""""""
"COLORS START
"""""""""""""""""""""""
"#1
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

"#2
"let g:molokai_original = 1
"let g:rehash256 = 1
set t_Co=256
colorscheme molokai

"#3
"colorscheme twilight

"#4
"colorscheme desert
"""""""""""""""""""""""
" COLORS END
"""""""""""""""""""""""

"display real information of cursor
set ruler
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %31\ %c\ %p%%%)

"display incomplete commands
set showcmd

"higtlight search
set hlsearch 
"incremental search, highlight every character when input
set incsearch

"highlight current row and column
"set cursorline
"set cursorcolumn

"parenthesis highlight matching
set showmatch

"always display status line(last line)
set laststatus=2

"disable mouse
set mouse= 

"VIM commands smart completion
set wildmenu

"indent settings
set ts=4
set sw=4
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set cindent
set smartindent

"fold code block based on indent or syntax
"set foldmethod=indent
set foldmethod=syntax
set nofoldenable

"enable file type detection
filetype off

"""""""""""""""""""""""
" Vundle START
"""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
"color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

"""Bundles
Bundle 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
"filetype plugin on
"""""""""""""""""""""""
" Vundle END
"""""""""""""""""""""""

"""""""""""""""""""""""
" YCM START
"""""""""""""""""""""""
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"Go to definition else declaration
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:ycm_complete_in_comments=1
"let g:ycm_collect_identifiers_from_tags_files=1
"set completeopt-=preview
"let g:ycm_min_num_of_chars_for_completion=1
"let g:ycm_cache_omnifunc=0
"let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-a>'
"""""""""""""""""""""""
" YCM END
"""""""""""""""""""""""

"""""""""""""""""""""""
" NERD TREE START
"""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"""""""""""""""""""""""
" NERD TREE END
"""""""""""""""""""""""

"""""""""""""""""""""""
" TAGBAR START
"""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
" autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }
"""""""""""""""""""""""
" TAGBAR END
"""""""""""""""""""""""

"""""""""""""""""""""""
" INDENT GUIDE START
"""""""""""""""""""""""
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
"""""""""""""""""""""""
" INDENT GUIDE END
"""""""""""""""""""""""

"""""""""""""""""""""""
" POWERLINE START
"""""""""""""""""""""""
"let g:Powerline_symbols = "unicode"
"let g:Powerline_symbols = 'fancy'
"""""""""""""""""""""""
" POWERLINE END
"""""""""""""""""""""""

"""""""""""""""""""""""
" CSCOPE START
"""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    else
        let cscope_file=findfile("cscope.out", ".;")
        let cscope_pre=matchstr(cscope_file, ".*/")
        if !empty(cscope_file) && filereadable(cscope_file)
            exe "cs add" cscope_file cscope_pre
        endif
    endif
    set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"""""""""""""""""""""""
" CSCOPE END
"""""""""""""""""""""""

"""""""""""""""""""""""
" ACK.VIM START
"""""""""""""""""""""""
nmap <F7> :Ack -i<space>
"""""""""""""""""""""""
" ACK.VIM END
"""""""""""""""""""""""

"??
filetype indent on

autocmd FileType python setlocal et sta sw=4 sts=4

"""""""""""""""""""""""
" auto add Python header -START
"""""""""""""""""""""""
"autocmd BufNewFile *.py 0r ~/.templates/python_header
"autocmd BufNewFile *.py ks|call FileName()|'s
"autocmd BufNewFile *.py ks|call CreatedTime()|'s
"
"fun FileName()
"    if line("$") > 11
"        let l = 12
"    else
"        let l = line("$")
"    endif
"    exe "1," . l . "g/File Name : .*/s/File Name : .*/File Name : " .expand("%")
"endfun
"
"fun CreatedTime()
"    if line("$") > 11
"        let l = 12
"    else
"        let l = line("$")
"    endif
"exe "1," . l . "g/Created Time : .*/s/Created Time : .*/Created Time : " .strftime("%Y-%m-%d %T")
"endfun
"""""""""""""""""""""""
" auto add Python header -END
"""""""""""""""""""""""

"""""""""""""""""""""""
" tool : pydiction
"""""""""""""""""""""""
filetype plugin on
"let g:pydiction_location = '/Users/ytjiang/.vim/complete-dict'

"command perfix buttom
let mapleader=";"

" CTAGS
set tags=./tags,tags;$HOME
