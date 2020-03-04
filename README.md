syntax source for asyncomplete.vim via conjure
==================================================

Provide syntax autocompletion source for [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim) via
[conjure](https://github.com/Olical/conjure)

### Installing

#### Registration

```vim
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
    \ 'name': 'conjure',
    \ 'whitelist': ['clojure'],
    \ 'completor': function('asyncomplete#sources#conjure#completor'),
    \ }))
```
