" File: plugin/neosnippet-defines.vim
" Author: yuratomo (twitter @yusetomo)

if exists('g:loaded_neosnippet_defines') && g:loaded_neosnippet_defines == 1
  finish
endif

function! neosnippet#complete(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '[a-zA-Z_]'
      let start -= 1
    endwhile
    return start
  else
    try
      return filter(values(neosnippet#helpers#get_snippets()), 'v:val.word =~ a:base')
    catch
      return []
    endtry
  catch 
  endif
endfunc

function! neosnippet#ref(ft)
  for file in split(globpath(&runtimepath, 'doc/' . a:ft . '.txt'), '\n')
    exec "vsp " . file
  endfor
  vert res 40
  setlocal bt=nofile noswf nomodifiable nowrap hidden nolist
endfunc

command! -nargs=0 XamlRef :call neosnippet#ref('xaml')

let g:loaded_neosnippet_defines = 1
