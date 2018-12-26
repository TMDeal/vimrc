let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [[ 'mode', 'paste' ], [ 'git', 'virtualenv', 'filename' ], ['ctrlpmark']],
            \   'right': [[ 'neomake_warnings', 'neomake_errors', 'neomake_ok' ],
            \            [ 'percent' ],
            \            [ 'langserver' ],
            \            [ 'fileformat', 'fileencoding', 'filetype' ]],
            \ },
            \ 'component_function': {
            \   'git': 'statusline#Git',
            \   'virtualenv': 'virtualenv#statusline',
            \   'filename': 'statusline#Filename',
            \   'fileformat': 'statusline#Fileformat',
            \   'filetype': 'statusline#Filetype',
            \   'fileencoding': 'statusline#Fileencoding',
            \   'langserver': 'LanguageClient#statusLine',
            \   'mode': 'statusline#Mode',
            \   'ctrlpmark': 'statusline#CtrlPMark',
            \ },
            \ 'component_expand': {
            \   'neomake_warnings': 'statusline#NeomakeWarnings',
            \   'neomake_errors': 'statusline#NeomakeErrors',
            \   'neomake_ok': 'statusline#NeomakeOK',
            \ },
            \ 'component_type': {
            \   'neomake_warnings': 'warning',
            \   'neomake_errors': 'error',
            \   'neomake_ok': 'left',
            \ },
            \ 'subseparator': { 'left': '|', 'right': '|' }
            \ }

let g:tagbar_status_func = 'statusline#TagbarStatusFunc'
let g:ctrlp_status_func = {
            \ 'main': 'statusline#CtrlPStatusFunc_1',
            \ 'prog': 'statusline#CtrlPStatusFunc_2',
            \ }
