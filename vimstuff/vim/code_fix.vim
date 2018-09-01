"auto remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"for all files
"autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

fun! <SID>StripMultipleLineBreaks()
    let l = line(".")
    let c = col(".")
    %s/\(^\s*$\n\)\+/
/e
    call cursor(l, c)
endfun

autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>StripMultipleLineBreaks()

"seperate comma from the next character
"fun! <SID>SeperateComma()
"    let l = line(".")
"    let c = col(".")
"    %s/,\(\S\)/, \1/ge
"    call cursor(l, c)
"endfun

"autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>SeperateComma()

"seperate ){
fun! <SID>SeperateBraces()
    let l = line(".")
    let c = col(".")
    %s/){/) {/ge
    call cursor(l, c)
endfun

autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>SeperateBraces()

"seperate function(
"fun! <SID>SeperateFuncBrace()
"    let l = line(".")
"    let c = col(".")
"    %s/function(/function (/ge
"    call cursor(l, c)
"endfun

" autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>SeperateFuncBrace()




