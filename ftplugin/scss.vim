function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('lsp') && has_key(g:LanguageClient_serverCommands, 'scss') == 1
            call leader#SetupLSP()
        endif
    endif
endfunction

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
