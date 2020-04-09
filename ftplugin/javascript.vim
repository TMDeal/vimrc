function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('jsdoc')
            let g:leader_map.m.d = ['JsDoc', 'JsDoc']
        endif
        if dein#tap('js-alternate')
            let g:leader_map.m.a = ['call js_alternate#run()', 'alternate file']
        endif
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'javascript.jsx' | call s:SetLeaderGuideMappings() | endif
    au BufEnter * if &ft ==# 'javascript' | call s:SetLeaderGuideMappings() | endif
augroup END

setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
