let s:initialized = 0
function! asyncomplete#sources#conjure#completor(opt, ctx)
    if !conjure#should_autocomplete()
        return
    endif

    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\w\+$')
    let l:kwlen = len(l:kw)

    let l:matches = conjure#completions(l:kw) 
    let l:startcol = l:col - l:kwlen

    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction

function! asyncomplete#sources#conjure#get_source_options(opts)
   return a:opts
endfunction
