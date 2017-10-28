function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('jsdoc')
            let g:leader_map.m.D = ['JsDoc', 'JsDoc']
        endif
        if dein#tap('js-alternate')
            let g:leader_map.m.a = ['call js_alternate#run()', 'alternate file']
        endif
        if dein#tap('ternjs')
            let g:leader_map.m.t = {'name': '[tern]'}
            let g:leader_map.m.t.d = ['TernDef', 'goto definition']
            let g:leader_map.m.t.D = ['TernDoc', 'show documentation']
            let g:leader_map.m.t.t = ['TernType', 'show type']
            let g:leader_map.m.t.R = ['TernRefs', 'show references']
            let g:leader_map.m.t.r = ['TernRename', 'rename']
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
