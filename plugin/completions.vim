if dein#tap('ultisnips')
    let g:UltiSnipsExpandTrigger='<C-k>'
    let g:UltiSnipsJumpForwardTrigger='<C-k>'
    let g:UltiSnipsJumpBackwardTrigger='<C-j>'
    let g:UltiSnipsSnippetDirectories=['ultisnips']
endif

if dein#tap('delimitMate')
    let g:delimitMate_matchpairs="(:),[:],{:}"
    let g:delimitMate_quotes="\" ' `"
    let g:delimitMate_nesting_quotes=['"']
    let g:delimitMate_expand_cr=1
    let g:delimitMate_expand_space=1
    let g:delimitMate_expand_inside_quotes = 1
    let g:delimitMate_jump_expansion=1
    let g:delimitMate_balance_matchpairs=1
endif
