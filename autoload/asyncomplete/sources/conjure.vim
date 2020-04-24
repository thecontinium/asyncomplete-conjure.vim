function! asyncomplete#sources#conjure#completor(opt, ctx)
    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\w\+$')
    let l:kwlen = len(l:kw)
    let l:startcol = l:col - l:kwlen

    let l:matches = s:gather_candidates(l:kw)

    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction

function! asyncomplete#sources#conjure#get_source_options(opts)
   return a:opts
endfunction

function s:gather_candidates(typed)
   let p = luaeval("require('conjure.eval')['completions-promise'](...)", a:typed)
   let w = luaeval("require('conjure.promise')['await'](...)", p)
   let m = luaeval("require('conjure.promise')['close'](...)", p)
   return m
 endfunction
