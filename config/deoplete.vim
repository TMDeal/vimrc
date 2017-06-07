let g:deoplete#omni_patterns={}
let g:deoplete#omni#input_patterns={}
let g:deoplete#omni#functions={}
let g:deoplete#ignore_sources={}
let g:deoplete#sources={}

let g:neoinclude#exts={}
let g:neoinclude#exts.cpp = ['', 'h', 'hpp', 'hh']

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=0
let g:deoplete#max_menu_width=80
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#ignore_sources._=['around']

let g:tern_request_timeout=1
let g:tern_show_signature_in_pum=0
let g:tern#command=["tern"]
let g:tern#arguments=["--persistent"]

let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
let g:deoplete#sources#clang#std#cpp='c++1y'

call deoplete#custom#set('_', 'matchers', [
            \'matcher_full_fuzzy',
            \'matcher_length'
            \])

call deoplete#custom#set('_', 'converters', [
            \'converter_remove_overlap', 
            \'converter_truncate_abbr',
            \'converter_truncate_menu',
            \'converter_remove_paren'
            \])

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-l> deoplete#refresh()
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
" inoremap <silent><expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <silent><expr><BS> deoplete#smart_close_popup()."\<C-h>"
"
let g:deoplete#omni#functions.javascript=[
            \ 'tern#Complete',
            \ 'jspc#omni'
            \]

let g:deoplete#omni#input_patterns.tex = '\\(?:'
            \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
            \ . '|hyperref\s*\[[^]]*'
            \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
            \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
            \ .')'
