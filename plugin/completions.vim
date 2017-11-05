if dein#tap('neosnippet')
    let g:neosnippet#enable_snipmate_compatibility=1
    let g:neosnippet#enable_completed_snippet=1
    let g:neosnippet#snippets_directory='$EDITOR_ROOT/snippets'

    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
    " inoremap <silent> <c-u> <c-r>=cm#sources#neosnippet#trigger_or_popup("\<Plug>(neosnippet_expand_or_jump)")<cr>
    " vmap <c-u>     <Plug>(neosnippet_expand_target)

    " let g:neosnippet#disable_runtime_snippets={'_': 1}

    if has('conceal')
        set conceallevel=2 concealcursor=niv
    endif
endif

if dein#tap('lsp')
    let g:LanguageClient_autoStart=1
    let g:LanguageClient_diagnosticsEnable=0
    let g:LanguageClient_diagnosticsList='location'
    let g:LanguageClient_windowLogMessageLevel='Error'
    let g:LanguageClient_serverCommands={}

    if executable('javascript-typescript-stdio')
        let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
        let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
    endif
    if executable('html-languageserver')
        let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
    endif
    if executable('css-languageserver')
        let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
        let g:LanguageClient_serverCommands.scss = ['css-languageserver', '--stdio']
        let g:LanguageClient_serverCommands.less = ['css-languageserver', '--stdio']
    endif
    if executable('json-languageserver')
        let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']
    endif
    if executable('pyls')
        let g:LanguageClient_serverCommands.python = ['pyls']
    endif
    if executable('clangd')
        let g:LanguageClient_serverCommands.cpp = ['clangd']
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
                \ 'module': 'cm_matchers.fuzzy_matcher',
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
