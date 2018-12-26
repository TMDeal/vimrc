let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [[ 'mode', 'paste' ], [ 'git', 'virtualenv', 'filename' ], ['ctrlpmark']],
            \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
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
            \  'linter_checking': 'statusline#checking',
            \  'linter_warnings': 'statusline#warnings',
            \  'linter_errors': 'statusline#errors',
            \  'linter_ok': 'statusline#ok',
            \ },
            \ 'component_type': {
            \  'linter_checking': 'left',
            \  'linter_warnings': 'warning',
            \  'linter_errors': 'error',
            \  'linter_ok': 'left',
            \ },
            \ 'subseparator': { 'left': '|', 'right': '|' }
            \ }

let g:tagbar_status_func = 'statusline#TagbarStatusFunc'
let g:ctrlp_status_func = {
            \ 'main': 'statusline#CtrlPStatusFunc_1',
            \ 'prog': 'statusline#CtrlPStatusFunc_2',
            \ }
