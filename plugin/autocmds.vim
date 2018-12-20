augroup my_autocmds
    au!

    "Lint
    if dein#tap('ale')
        if dein#tap('lightline')
            au User ALELintPost call lightline#update()
        endif
    endif

    "format files on save
    " au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry

    autocmd VimEnter * silent! autocmd! FileExplorer
    au BufNew,BufEnter,VimEnter * if isdirectory(expand("<amatch>")) | call dein#source("nerdtree") | endif

    au VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

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
