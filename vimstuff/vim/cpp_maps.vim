"change type to { type: <original>, required: true};
let g:inx = 1

fu! CIncr()
   let tmp = g:inx
   let g:inx = g:inx + 1
   return "std::cout<<\"-D- ".tmp."\"<<std::endl;"
endfu

fu! Dbg()
   return "std::cout<<\"-D- \"<<std::endl;"
endfu

inoremap <buffer> ;d <C-R>=Dbg()<CR>
noremap <buffer> ;d o<C-R>=Dbg()<CR><esc>
inoremap <buffer> ;c <C-R>=CIncr()<CR>
noremap <buffer> ;c o<C-R>=CIncr()<CR><esc>

