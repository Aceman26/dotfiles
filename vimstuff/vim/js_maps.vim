"change type to { type: <original>, required: true};
"inoremap <buffer> ;r <esc>b<insert>{type: <esc><right>e<insert><right>, required:true}

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let g:inx = 1

fu! CIncr()
   let tmp = g:inx
   let g:inx = g:inx + 1
   return "console.log(\'DEBUG-".tmp."-".expand('%:t:r')."\');"
endfu

inoremap <buffer> ;c <C-R>=CIncr()<CR>
noremap <buffer> ;c o<C-R>=CIncr()<CR><esc>

nnoremap ,o A,<esc>o
nnoremap ,p A,<esc>p
nnoremap ,e A,<esc>

noremap <buffer> <A-j> :JSHint<esc>

" " Translation for RN
" let g:note_str = ""
" 
" function! Translate()
"     let str1 = getreg("@")
"     let str1 = substitute(str1,"{","","")
"     let str1 = substitute(str1,"}","","")
"     let str1 = substitute(str1,"\"","","g")
"     let str1 = substitute(str1,"\'","","g")
"     let str2 = join(split(tolower(str1), " "), "_")
"     let g:note_str = str2 . "_note" 
"     call append(line('$'), '  ' . str2 . ' : "' . str1 . '",')
"     return "strings." . str2 
" endfunction
" 
" function! SetNote()
"     let str0 = getreg("@")
"     let str1 = substitute(str0,"{","","")
"     let str1 = substitute(str1,"}","","")
"     let str1 = substitute(str1,"\"","","g")
"     let str1 = substitute(str1,"\'","","g")
"     let str2 = join(split(tolower(str1), " "), "_")
"     let g:note_str = str2 . "_note" 
"     return str0 
" endfunction
" 
" function! TranslateNote()
"     let str1 = getreg("@")
"     let str1 = substitute(str1,"{","","")
"     let str1 = substitute(str1,"}","","")
"     let str1 = substitute(str1,"\"","","g")
"     let str1 = substitute(str1,"\'","","g")
"     let str2 = g:note_str 
"     call append(line('$'), '  ' . str2 . ' : "' . str1 . '",')
"     return "strings." . str2 
" endfunction
" 
" function! TranslateExists()
"     let str1 = getreg("@")
"     let str1 = substitute(str1,"{","","")
"     let str1 = substitute(str1,"}","","")
"     let str1 = substitute(str1,"\"","","g")
"     let str1 = substitute(str1,"\'","","g")
"     let str2 = join(split(tolower(str1), " "), "_")
"     return "strings." . str2 
" endfunction
" 
" function! TranslateBrakets()
"     return "{".Translate(). "}"
" endfunction
" 
" function! TranslateNoteBrakets()
"     return "{".TranslateNote(). "}"
" endfunction
" 
" function! TranslateExistsBrakets()
"     return "{".TranslateExists(). "}"
" endfunction
" 
" 
" function! Comment()
"     let str = getreg("@")
"     return "{/* " . str . " */}"
" endfunction
" 
" vnoremap ;tl s<C-R>=Translate()<CR><ESC>
" vnoremap ;tbl s<C-R>=TranslateBrakets()<CR><ESC>
" vnoremap ;tn s<C-R>=TranslateNote()<CR><ESC>
" vnoremap ;tbn s<C-R>=TranslateNoteBrakets()<CR><ESC>
" vnoremap ;te s<C-R>=TranslateExists()<CR><ESC>
" vnoremap ;tbe s<C-R>=TranslateExistsBrakets()<CR><ESC>
" vnoremap ;sn s<C-R>=SetNote()<CR><ESC>
" vnoremap ;ac s<C-R>=Comment()<CR><ESC>
" 
" 
" function! AddStopPropagation()
"    return "<div onClick={(e)=> e.stopPropagation()}>"
" endfunction
" 
" map ;dsp o<C-R>=AddStopPropagation()<CR><esc>

:ab consle console
