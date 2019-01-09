if dein#tap('deoplete')
    "Deoplete Settings
    let g:deoplete#enable_at_startup=1

    let g:deoplete#auto_complete_delay=5  " Default is 50
    let g:deoplete#auto_refresh_delay=30  " Default is 500

    let g:deoplete#enable_smart_case=0
    let g:deoplete#max_menu_width=80
    let g:deoplete#file#enable_buffer_path=1

    "Neoinclude
    if !exists('g:neoinclude#exts')
        let g:neoinclude#exts={}
    endif
    let g:neoinclude#exts.cpp=['', 'h', 'hpp', 'hh']

    "C/C++
    let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-3.8/lib/libclang.so"
    let g:deoplete#sources#clang#clang_header="/usr/lib/llvm-3.8/lib/clang/3.8.1/include/"
    let g:deoplete#sources#clang#clang_complete_database="./build"

    "GO
    let g:deoplete#sources#go#gocode_binary='$GOPATH/bin/gocode'
    let g:deoplete#sources#go#cgo#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
    let g:deoplete#sources#go#source_importer=1
    let g:deoplete#sources#go#unimported_packages=1
    let g:deoplete#sources#go#pointer=1
    let g:deoplete#sources#go#cgo=1


    "Matchers
    call deoplete#custom#source('_', 'matchers', [
                \'matcher_full_fuzzy',
                \'matcher_length'
                \])

    "Converters
    call deoplete#custom#source('_', 'converters', [
                \'converter_remove_overlap', 
                \'converter_truncate_abbr',
                \'converter_truncate_menu',
                \'converter_remove_paren'
                \])

    "Custom Options
    call deoplete#custom#option('ignore_sources', {'_': ['tag', 'around']})
    call deoplete#custom#option('omni_patterns', {
                \ 'gohtmltmpl': ['<', '<[^>]*\s[[:alnum:]-]*']
                \})

    " call deoplete#custom#source('omni', 'functions', {
    "             \   'go': 'go#complete#Complete'
    "             \})
    " call deoplete#custom#var('omni', 'input_patterns', {
    "             \ 'go': '[^. *\t]\.\w*',
    "             \})

    "Key bindings
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

    inoremap <expr><C-g> deoplete#undo_completion()

    inoremap <expr><C-l> deoplete#refresh()
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
    inoremap <silent><expr><C-h> deoplete#smart_close_popup()."\<C-h>"
endif
