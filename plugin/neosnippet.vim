" File: plugin/neosnippet-defines.vim
" Author: yuratomo (twitter @yusetomo)

if exists('g:loaded_neosnippet_defines') && g:loaded_neosnippet_defines == 1
  finish
endif

function! neosnippet#Complete(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    return filter(values(neosnippet#get_snippets()), 'v:val.word =~ a:base')
  endif
endfunc

let g:loaded_neosnippet_defines = 1
