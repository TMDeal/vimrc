if dein#tap('ultisnips')
    imap <expr> <Plug>(ultisnips_expand) ("\<c-k>")
    let g:UltiSnipsExpandTrigger='<c-k>'
    let g:UltiSnipsJumpForwardTrigger='<c-k>'
    let g:UltiSnipsJumpBackwardTrigger='<c-j>'
    let g:UltiSnipsRemoveSelectModeMappings=0
    " let g:UltiSnipsExpandTrigger='<C-k>'
    " let g:UltiSnipsJumpForwardTrigger='<C-k>'
    " let g:UltiSnipsJumpBackwardTrigger='<C-j>'
    " let g:UltiSnipsRemoveSelectModeMappings=0
    let g:UltiSnipsSnippetDirectories=['ultisnips']
endif

if dein#tap('neosnippet')
    let g:neosnippet#enable_snipmate_compatibility=1
    let g:neosnippet#enable_completed_snippet=1
    let g:neosnippet#snippets_directory='$EDITOR_ROOT/snippets'

    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    inoremap <silent> <c-u> <c-r>=cm#sources#neosnippet#trigger_or_popup("\<Plug>(neosnippet_expand_or_jump)")<cr>
    vmap <c-u>     <Plug>(neosnippet_expand_target)

    " let g:neosnippet#disable_runtime_snippets = {
    "             \   '_' : 1,
    "             \ }

    if has('conceal')
        set conceallevel=2 concealcursor=niv
    endif
endif

if dein#tap('delimitMate')
    let g:delimitMate_matchpairs='(:),[:],{:}'
    let g:delimitMate_quotes="\" ' `"
    let g:delimitMate_nesting_quotes=['"']
    let g:delimitMate_expand_cr=1
    let g:delimitMate_expand_space=1
    let g:delimitMate_expand_inside_quotes = 1
    let g:delimitMate_jump_expansion=1
    let g:delimitMate_balance_matchpairs=1
endif

if dein#tap('ncm')
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    imap <expr> <silent> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<Plug>delimitMateCR")

    imap <c-space> <Plug>(cm_force_refresh)

    let g:cm_sources_override={
                \ 'cm-filepath': {'cm_refresh_min_word_len': 100},
                \ 'cm-tags': {'enable': 0}
                \ }

    let g:cm_matcher={
                \ 'module': 'cm_matchers.prefix_matcher',
                \ 'case': 'smartcase'
                \ }

    augroup my_autocmds
        au User CmSetup call cm#register_source({'name' : 'cm-html',
                    \ 'priority': 9, 
                    \ 'scoping': 1,
                    \ 'scopes': ['html'],
                    \ 'abbreviation': 'html',
                    \ 'word_pattern': '[\w]+',
                    \ 'cm_refresh_patterns':['<\w+'],
                    \ 'cm_refresh': {'omnifunc': 'htmlcomplete#CompleteTags'},
                    \ })
    augroup END
endif
