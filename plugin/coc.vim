if dein#tap('coc.nvim')
    let g:coc_filetype_map={
        \ "htmldjango": "html"
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

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    " inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


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
        " if (index(['vim','help'], &filetype) >= 0)
        "     execute 'h '.expand('<cword>')
        " else
        call CocAction('doHover')
        " endif
    endfunction

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')


    augroup coc_nvim
        au!
        " Setup formatexpr specified filetype(s).
        au FileType typescript,json,html,python setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " use `:ImpSort` for organize import of current buffer
    command! -nargs=0 ImpSort :call CocAction('runCommand', 'editor.action.organizeImport')

    let g:leader_map.p.r = ['call CocActionAsync("rename")', 'rename']
    let g:leader_map.p.l = [':CocList', 'list']
    let g:leader_map.p.f = [':CocList files', 'files']
    let g:leader_map.p.F = ['call CocActionAsync("format")', 'format']
    let g:leader_map['p'][']'] = [':CocNext', 'next']
    let g:leader_map['p']['['] = [':CocPrev', 'prev']


    " Using CocList
    " Show all diagnostics
    " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
endif
