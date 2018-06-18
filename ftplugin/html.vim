function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('lsp') && has_key(g:LanguageClient_serverCommands, 'html') == 1
            call leader#SetupLSP()
        endif
    endif
endfunction

augroup my_autocmds
    autocmd VimEnter * if exists(projectroot#guess() . '/angular.json') != '' | call angular_cli#init() | endif
augroup END

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
