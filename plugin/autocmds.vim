augroup my_autocmds
    au!

    autocmd VimEnter * silent! autocmd! FileExplorer
    au BufNew,BufEnter,VimEnter * if isdirectory(expand("<amatch>")) | call dein#source("nerdtree") | endif

    "resize automatically
    au VimResized * execute "normal! \<c-w>="

    au BufReadPost * call functions#LineReturn()

    if dein#tap('projectroot')
        au BufEnter * call functions#AutoCDtoProjectRoot()
    endif

    if dein#tap('leader-guide')
        au BufLeave * if &ft != 'LeaderGuide' | call leader#ClearMode() | endif
    endif
augroup END
