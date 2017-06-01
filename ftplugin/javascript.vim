function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('jsdoc')
            let g:leader_map.m.D = ['JsDoc', 'JsDoc']
        endif
    endif
endfunction

call s:SetLeaderGuideMappings()

augroup my_autocmds
    au!
    au Filetype javascript call s:SetLeaderGuideMappings()
augroup END

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
