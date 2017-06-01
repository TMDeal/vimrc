if !dein#tap('lightline')
    set statusline=
    set statusline+=\%{statusline#Mode()}
    set statusline+=\ %{statusline#Filename()}
    if dein#tap('fugitive')
        set statusline+=\ %{statusline#Git()}
    endif
    set statusline+=%=
    set statusline+=\ %{statusline#Fileformat()}
    set statusline+=\ %{statusline#Fileencoding()}
    set statusline+=\ %{statusline#Filetype()}
    "display percentage through file
    set statusline+=\ [%P]
    "display line:column number
    set statusline+=\ [%l:%c]
    if dein#tap('ale')
        set statusline+=\ %{ale#statusline#Status()}
    endif
else
    let g:lightline = {
                \ 'colorscheme': 'jellybeans',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'git', 'filename' ], ['ctrlpmark'] ],
                \   'right': [ [ 'ale', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \   'git': 'lightline#statusline#Git',
                \   'filename': 'lightline#statusline#Filename',
                \   'fileformat': 'lightline#statusline#Fileformat',
                \   'filetype': 'lightline#statusline#Filetype',
                \   'fileencoding': 'lightline#statusline#Fileencoding',
                \   'mode': 'lightline#statusline#Mode',
                \   'ctrlpmark': 'lightline#statusline#CtrlPMark',
                \ },
                \ 'component_expand': {
                \   'ale' : 'ale#statusline#Status',
                \ },
                \ 'component_type': {
                \   'ale' : 'error',
                \ },
                \ 'subseparator': { 'left': '|', 'right': '|' }
                \ }

    let g:tagbar_status_func = 'lightline#statusline#TagbarStatusFunc'
    let g:ctrlp_status_func = {
                \ 'main': 'lightline#statusline#CtrlPStatusFunc_1',
                \ 'prog': 'lightline#statusline#CtrlPStatusFunc_2',
                \ }
endif
