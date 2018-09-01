:set tabpagemax=100

" Map <A-c> to color current word in special color
let color_idx=0
let color_max=24
let color_0="yellow"
let color_1="red"
let color_2="tomato"
let color_3="DarkSalmon"
let color_4="sienna"
let color_5="LightGoldenrod"
let color_6="DarkOliveGreen4"
let color_7="DarkCyan"
let color_8="orange"
let color_9="cyan"
let color_10="NavajoWhite"
let color_11="purple"
let color_12="LightPink"
let color_13="magenta"
let color_14="violet"
let color_15="darkyellow"
let color_16="green"
let color_17="lightgreen"
let color_18="darkgreen"
let color_19="seagreen"
let color_20="blue"
let color_21="lightblue"
let color_22="slateblue"
let color_23="lightcyan"
let color_24="lightmagenta"
map <A-c> :let @t=expand("<cword>")<CR>:syn match col_<C-R>t "\<<C-R>t\>"<CR>:hi col_<C-R>t guifg=<C-R>=color_{color_idx}<CR> gui=bold<CR>:let color_idx=color_idx==color_max?0:color_idx+1<CR>:let col_prev="col_" . @t<CR>
map <A-S-c> "ty:let @t = substitute(escape(@t,"^$][/\\*.~`'"),"<C-V><C-@>","\\\\n","g")<CR>:syn match col_mark<C-R>=color_idx<CR> "<C-R>t"<CR>:hi col_mark<C-R>=color_idx<CR> guifg=<C-R>=color_{color_idx}<CR> gui=bold<CR>:let color_idx=color_idx==color_max?0:color_idx+1<CR>:let col_prev="col_mark" . color_idx <CR>
" Color the same as previous color
map <A-v> :let @t=expand("<cword>")<CR>:syn match <C-R>=col_prev<CR> "\<<C-R>t\>"<CR>
" Delete coloring
map <A-S-c> :let @t=expand("<cword>")<CR>:hi clear col_<C-R>t<CR>
" Add background color
map <A-a> :let @t=expand("<cword>")<CR>:syn match col_<C-R>t "\<<C-R>t\>"<CR>:hi col_<C-R>t guibg=yellow guifg=black gui=bold<CR>:echo "<C-R>t"<CR>


" Move tabs
map <A-tab> :tabnext<CR>
map <A-s-tab> :tabprev<CR>
map <A-]> :tabnext<CR>
map <A-[> :tabprev<CR>


function! GvimColorTest(outfile)
  let result = []
  for red in range(0, 255, 16)
    for green in range(0, 255, 16)
      for blue in range(0, 255, 16)
        let kw = printf('%-13s', printf('c_%d_%d_%d', red, green, blue))
        let fg = printf('#%02x%02x%02x', red, green, blue)
        let bg = '#fafafa'
        let h = printf('hi %s guifg=%s guibg=%s', kw, fg, bg)
        let s = printf('syn keyword %s %s', kw, kw)
        call add(result, printf('%s | %s', h, s))
      endfor
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
command! GvimColorTest call GvimColorTest('gvim-color-test.tmp')

