if dein#tap('neosnippet')
    let g:neosnippet#enable_snipmate_compatibility=1
    " let g:neosnippet#enable_completed_snippet=1
    let g:neosnippet#snippets_directory='$EDITOR_ROOT'.$SEP.'snippets'

    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    " let g:neosnippet#disable_runtime_snippets={'_': 1}

    if has('conceal')
        set conceallevel=2 concealcursor=niv
    endif
endif
