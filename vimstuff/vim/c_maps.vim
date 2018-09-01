"change type to { type: <original>, required: true};
let g:inx = 1

fu! CIncr()
   let tmp = g:inx
   let g:inx = g:inx + 1
   return "printf(\"-D- ".tmp."\\n\");"
endfu

inoremap <buffer> ;c <C-R>=CIncr()<CR>
noremap <buffer> ;c o<C-R>=CIncr()<CR><esc>

