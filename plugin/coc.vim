if dein#tap('coc.nvim')
    let g:coc_filetype_map={
        \ "htmldjango": "html",
        \ "eelixir": "html"
      \ }

    let g:coc_global_extensions=[
        \ 'coc-json',
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-python',
        \ 'coc-yank',
        \ 'coc-snippets',
        \ 'coc-lists',
        \ 'coc-git',
        \ 'coc-emmet',
        \ 'coc-tsserver',
        \ 'coc-angular',
      \ ]

    let g:coc_snippet_next = '<C-k>'
    let g:coc_snippet_prev = '<C-j>'

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
    inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    augroup coc_nvim
        au!
        " Setup formatexpr specified filetype(s).
        au FileType typescript,json,html,python setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        " Highlight symbol under cursor on CursorHold
        au CursorHold * silent call CocActionAsync('highlight')
    augroup end

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " use `:ImpSort` for organize import of current buffer
    command! -nargs=0 ImpSort :call CocAction('runCommand', 'editor.action.organizeImport')

    let g:leader_map.p.r = ['execute "normal \<Plug>(coc-rename)"', 'rename']
    let g:leader_map.p.a = ['execute "normal \<Plug>(coc-codeaction)"', 'code action']
    let g:leader_map.p.F = ['execute "normal \<Plug>(coc-format)"', 'format']
    let g:leader_map.p.l = ['CocList', 'list']
    let g:leader_map.p.f = ['CocList files', 'files']
    let g:leader_map.p.A = ['CocList diagnostics', 'diagnostics']
    let g:leader_map.p.c = ['CocList commands', 'commands']
    let g:leader_map.p.o = ['CocList outline', 'outline']
    let g:leader_map.p.s = ['CocList -I symbols', 'symbols']
    let g:leader_map['p'][']'] = ['CocNext', 'next']
    let g:leader_map['p']['['] = ['CocPrev', 'prev']
    let g:leader_map.p.R = ['CocListResume', 'resume']
endif
