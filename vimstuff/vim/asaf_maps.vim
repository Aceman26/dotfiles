map `` <c-w>_
map `= <c-w>= 
map `q <c-w><down><c-w>_ 
map `1 <c-w><up><c-w>_
map `w <c-w><down>
map `2 <c-w><up>

"remove all lines that contains the highlited text
vmap <f2> y<esc>:g/<c-r>"/d<cr> 

"remove all lines that dos not contains the highlited text
vmap <f3> y<esc>:v/<c-r>"/d<cr> 

"find hilighted text (text can include '/' sign"
vmap <f4>  y<esc>:s#\(<c-r>"\)#\1<cr>u

"insert remark: asaf \/
map ;y <up>:r !date<cr><home>i# \/ asaf, <esc>
map ;yv <up>:r !date<cr><home>i/* asaf, <esc><end>a */<esc>
map <c-z> :r !date<cr>i<bs> asaf, <end><esc>
imap <c-z> <esc>:r !date<cr>i<bs> asaf, <end>
map ;r <up>:r !date<cr><home>i//asaf,  <end> <del><esc><down>

"insert remark: /\ asaf  
map ;h o# /\ asaf <esc>

"copy line/ and remark tone of them
map ;dd yyp<up><home>i#<esc><down>

map <f5> %

" find initiation with same name as module
map ;i /^\s*\(\w*\) \+\1\w* *(<cr>
" find initiation
map ;ii /^\s*\w\+ \+\w\+\s*(\s*<cr>

" <f9> - look up for initiation
map <f9> ?^\s*\(\w*\)\s\+\w\+\s*(\s*<cr>
imap <f9> <esc>?^\s*\(\w*\)\s\+\w\+\s*(\s*<cr>

" <f11> - edit alternate file
map <f11> :e #<cr>

" write file
imap <f12> <esc>:w!<cr>
map <f12> :w!<cr>

" make selected area remarked
vmap ;rm :s/^/#<cr>

";m - print module you are in
map ;m ma?^\s*\<module\><CR>Wyiw'a:echo "module -->" @0<CR>

";sp - split-open file under cursor
"map ;sp <right>byw:sp <c-r>"<cr> 
map ;sp <right>ByE:sp <c-r>"<cr> 

"ctrl-e - open file under cursor
map <c-e>  <right>byw:e <c-r>"<cr><space>

";d write description to file
map ;d o# description:<cr># -----------------------------------------<cr><esc>2<up><end>a

"delete to end of line
imap <c-d> <esc><right>d<end>a


"put line as header, lines above and under
imap <c-l> <esc>yypp<up><up>:s/[^ ]/-/g<cr>:s/[^#]-/--/g<cr><down><down>:s/[^ ]/-/g<cr>:s/[^#]-/--/g<cr>i#-<esc>b<up>i# <esc>b<up>i#-<esc>bi <esc><down>i <esc><down>i <esc>/asdasdasdasdasd/<cr>
imap <c-t> <esc>:s/\([^ ]\)/# \1/<cr>yypp<up><up>:s/# .*/#-------------------------------------------------------/<cr><down><down>:s/# .*/#-------------------------------------------------------/<cr><down>i

"change begin of line
" map ^ :s/^//<left>

"change end of line
" map $ :s/$//<left>

"delete all selected
map <c-f3> y<esc>:%s/<c-r>"//g<cr>

" select all
"map <s-a> ggVG

" not in use
"map <c-n> :bnext<esc>
"map <c-p> :bprev<esc>

" find with / at the middle
map <s-f> :s#

""inoremap ;fn function ( ) {<esc>o}<esc>O<esc><

" Here's a map to help you tell just what syntax highlighting groups the item under the cursor actually is:
map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Map NerdTree
map  <leader>ont <esc>:cd %:p:h<cr>:NERDTree<CR>
imap <leader>ont <esc>:cd %:p:h<cr>:NERDTree<CR>i

" Nerd Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" general maps
nnoremap ;e A;<esc>
nnoremap >e A><esc>


" For local replace
nnoremap <leader>gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap <leader>gR gD:%s/<C-R>///gc<left><left><left>

