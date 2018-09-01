" Enable modern Vim features not compatible with Vi spec.
set nocompatible

""""""" Vundle
filetype off                  " required


"""""""""""""""""""""""""""""
"""    Display options      "
"""""""""""""""""""""""""""""
:set wrap
:set title
:set ruler
:set laststatus=2
:set titlestring=%t
:set guioptions=agimrLtTb "include button scrollbar
:set nocp
:hi cm guibg='Cyan'
:hi Visual guibg='Yellow' guifg='Darkred'
:hi normal guifg=black guibg=lemonchiffon 
:set completeopt-=preview

colorscheme wombat " The best colorscheme ever!

"""""""""""""""""""""""""""""
"""    General settings     "
"""""""""""""""""""""""""""""
:set backupdir=$HOME/.vimbak
:set history=20
:set undolevels=500
:syntax on
:set ignorecase
:set wildchar=<TAB>
:set showmatch
:set hlsearch
:set incsearch
:set smartindent
:set bs=2 "backspace allowed always
:set backspace=indent,eol,start
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set clipboard=unnamedplus
:set shell=/bin/bash
set formatoptions=croqlj

"""""""""""""""""""""""""""""
"""    WTF options          "
"""""""""""""""""""""""""""""

:set ts=8
:syn match cm ".*::.*"
:au! BufRead,BufNewFile *.lib    set filetype=abc

"""""""""""""""""""""""""""""""""""
"""    Global var for scripting   "
"""""""""""""""""""""""""""""""""""
let g:inx = 1

fu! InitInx(n)
   let g:inx = a:n
endfu

fu! Incr()
   let tmp = g:inx
   let g:inx = g:inx + 1
   return tmp
endfu

fu! Decr()
   let tmp = g:inx
   let g:inx = g:inx - 1
   return tmp
endfu

"""""""""""""""""""""""""""""
"""    Common typos         "
"""""""""""""""""""""""""""""
:ab teh the
:ab pritn print
:ab arch architecture

"""""""""""""""""""""""""""""""""
"""    Common keystroke typos   "
"""""""""""""""""""""""""""""""""
" Often I hold shift too long when issuing these commands.
command! -bang Q q<bang>
command! -bang Qall qall<bang>
command! -bang W w<bang>
command! -bang Wall wall<bang>
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Redraw redraw!
command! -nargs=* Set set <args>
nmap Q: :q

" this one causes a pause whenever you use q, so I don't use it
nmap q: :q

"never use Ex mode -- I never *mean* to press it
nnoremap Q <ESC>

"""""""""""""""""""""""""""
""" Vim Plug(ins)         "
"""""""""""""""""""""""""""
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-abolish'
Plug 'gioele/vim-autoswap'
Plug 'prabirshrestha/async.vim'
Plug 'natebosch/vim-lsc'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/Tagbar'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-syntastic/syntastic'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

"""""""""""""""""""""""""""""""""""""""
""" Auto format by google/vim-codefmt "
"""""""""""""""""""""""""""""""""""""""

augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

"""""""""""""""""""""""""""
""" One Source of Truth   "
"""""""""""""""""""""""""""
source ~/vim/asaf_maps.vim
source ~/vim/matchit.vim
source ~/vim/code_fix.vim
source ~/vim/tmp_maps.vim
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
au filetype javascript source ~/vim/js_maps.vim
au filetype java source ~/vim/java_maps.vim
au filetype cpp source ~/vim/cpp_maps.vim
au filetype c source ~/vim/c_maps.vim
au filetype python source ~/vim/py_maps.vim
au filetype soy source ~/vim/soy_maps.vim
au BufNewFile,BufRead *.bsh set filetype=sh

"""""""""""""""""""""""""""""
"""    Mapping!             "
"""""""""""""""""""""""""""""

"Shift-RIGHT complete when inc search what's under the cursor
"Shift-Down complete whole word - under cursor
cnoremap <S-Down> <CR>yiw<BS>/<C-R>"
cnoremap <S-Right> <CR>y/<Up>/e+1<CR><BS>/<C-R>=escape(@",'.*\/?')<CR>

"press / or n when visual mode - will search the selected string
vmap / y/<C-R>"<CR>
vmap n y/<C-R>"<CR>

"shift-right in insert mode - to visual (as in windows - mark)
imap <S-Right> <Esc><Right>v
vmap <S-Right> <Right>
vmap <CR> <Esc>
nmap <S-Right> v<Right>

"Shift-Insert = paste
nmap <S-Insert> <Esc>"*p
imap <S-Insert> <Esc>"*pi<Right>
cmap <S-Insert> <MiddleMouse>

" % highlight {..}
:nmap % v%

"toggle folds open/closed by pressing F9
augroup vimrc
  au BufReadPre * setlocal foldmethod=syntax
  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END
set foldlevel=99
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

""""""""""""""""""""""""""
"""    Spell Checking    "
""""""""""""""""""""""""""
au BufReadPost,BufNewFile *.js,*.soy,*.java setlocal spell spelllang=en_us
" Custom spelling highlighting
" hi SpellBad ctermfg=015 ctermbg=000 cterm=none guifg=#FFFFFF guibg=#000000 gui=none
map  <leader>ts <esc>:set spell!<CR>
imap <leader>ts <esc>:set spell!<CR>i

""""""""""""""""""""""""""""""""""""
""" Some java highlighting options "
""""""""""""""""""""""""""""""""""""
" :let java_highlight_functions=1
:let java_highlight_lambda=1
:let java_highlight_java_lang_ids=1
:let java_highlight_all=1

hi javaLambdaDef	ctermfg=152 guifg=#afd7d7 "rgb=175,215,215
hi javaFuncDef		ctermfg=179 guifg=#d7af5f "rgb=215,175,95
hi javaVarArg		ctermfg=152 guifg=#afd7d7 "rgb=175,215,215


"""""""""""""""
""" Syntastic "
"""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_java_checkers = ['glint']
let g:syntastic_html_checkers = ['']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""  Highlight all instances of word under cursor, when idle.  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

""""""""""""""""""""""""
""" debug highlighting "
""""""""""""""""""""""""
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

""""""""""""""""""""""""""
""" variable refactoring "
""""""""""""""""""""""""""
function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
nmap <Leader>rf "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x
