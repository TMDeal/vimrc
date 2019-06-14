let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [[ 'mode', 'paste' ], [ 'git', 'virtualenv', 'filename' ], ['cocstatus']],
            \   'right': [[ 'neomake_warnings', 'neomake_errors', 'neomake_infos', 'neomake_ok' ],
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
            \   'cocstatus': 'coc#status',
            \ },
            \ 'component_expand': {
            \   'neomake_infos': 'lightline#neomake#infos',
            \   'neomake_warnings': 'lightline#neomake#warnings',
            \   'neomake_errors': 'lightline#neomke#errors',
            \   'neomake_ok': 'lightline#neomake#ok',
            \ },
            \ 'component_type': {
            \   'neomake_warnings': 'warning',
            \   'neomake_errors': 'error',
            \   'neomake_ok': 'left',
            \ },
            \ 'subseparator': { 'left': '|', 'right': '|' }
            \ }

let g:tagbar_status_func = 'statusline#TagbarStatusFunc'
