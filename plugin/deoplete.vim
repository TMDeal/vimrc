if dein#tap('deoplete')
    let g:deoplete#enable_at_startup=1

    if !exists('g:neoinclude#exts')
        let g:neoinclude#exts = {}
    endif
    let g:neoinclude#exts.cpp=['', 'h', 'hpp', 'hh']

    let g:deoplete#enable_smart_case=0
    let g:deoplete#max_menu_width=80
    let g:deoplete#file#enable_buffer_path=1

    let g:deoplete#sources#clang#libclang_path=""
    let g:deoplete#sources#clang#clang_header=""

    let g:deoplete#sources#go#gocode_binary='$GOPATH/bin/gocode'
    let g:deoplete#sources#go#cgo#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
    let g:deoplete#sources#go#pointer=1
    let g:deoplete#sources#go#cgo=1

    if isdirectory(expand('$EDITOR_ROOT/.cache/deoplete/go/$GOOS_$GOARCH'))
        let g:deoplete#sources#go#use_cache=1
        let g:deoplete#sources#go#json_directory='$EDITOR_ROOT/.cache/deoplete/go/$GOOS_$GOARCH'
    endif

    call deoplete#custom#source('_', 'matchers', [
                \'matcher_full_fuzzy',
                \'matcher_length'
                \])

    call deoplete#custom#source('_', 'converters', [
                \'converter_remove_overlap', 
                \'converter_truncate_abbr',
                \'converter_truncate_menu',
                \'converter_remove_paren'
                \])

    call deoplete#custom#option('ignore_sources', {'_': ['tag', 'around']})

    call deoplete#custom#option('omni_patterns', {
                \ 'gohtmltmpl': ['<', '<[^>]*\s[[:alnum:]-]*']
                \})

    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
    inoremap <expr><C-g> deoplete#undo_completion()
    inoremap <expr><C-l> deoplete#refresh()
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
    inoremap <silent><expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    " imap <expr> <silent> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<Plug>delimitMateCR")
    " imap <expr> <silent> <CR> (pumvisible() ? "\<c-y>\<cr>" : delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "<cr>")
    " inoremap <silent><expr><BS> deoplete#smart_close_popup()."\<C-h>"
endif
