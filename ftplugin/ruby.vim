function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('lsp') && has_key(g:LanguageClient_serverCommands, 'javascript') == 1
            call leader#SetupLSP()
        endif
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'ruby' | call s:SetLeaderGuideMappings() | endif
    au BufEnter * if &ft ==# 'eruby' | call s:SetLeaderGuideMappings() | endif
augroup END

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
