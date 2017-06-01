augroup my_autocmds
    au!

    "Lint
    if dein#tap('ale')
        if dein#tap('lightline')
            au User ALELint call lightline#update()
        endif
    endif

    "resize automatically
    au VimResized * execute "normal! \<c-w>="

    au BufReadPost * call functions#LineReturn()

    if dein#tap('projectroot')
        au BufEnter * call functions#AutoCDtoProjectRoot()
    endif

    if dein#tap('leader-guide')
        au BufLeave * call functions#ClearLeaderModeMap()
    endif

augroup END
