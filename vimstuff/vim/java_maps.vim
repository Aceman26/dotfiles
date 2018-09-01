"change type to { type: <original>, required: true};
"inoremap <buffer> ;r <esc>b<insert>{type: <esc><right>e<insert><right>, required:true}

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/



let g:inx = 1

fu! CIncr()
   let tmp = g:inx
   let g:inx = g:inx + 1
   return "System.out.print(\"\\nDEBUG-".tmp."-".expand('%:t:r')."\\n\");"
endfu

inoremap <buffer> ;d <C-R>=CIncr()<CR>
noremap <buffer> ;d o<C-R>=CIncr()<CR><esc>

nnoremap ,o A,<esc>o
nnoremap ,p A,<esc>p
nnoremap ,e A,<esc>
