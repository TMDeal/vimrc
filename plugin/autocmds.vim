augroup my_autocmds
    au!

    "Lint
    if dein#tap('ale')
        if dein#tap('lightline')
            au User ALELint call lightline#update()
        endif
    endif

    au VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

    "resize automatically
    au VimResized * execute "normal! \<c-w>="

    au BufReadPost * call functions#LineReturn()

    if dein#tap('projectroot')
        au BufEnter * call functions#AutoCDtoProjectRoot()
    endif

    if dein#tap('leader-guide')
        au BufLeave * if &ft != 'LeaderGuide' | call functions#ClearLeaderModeMap() | endif
    endif

augroup END
