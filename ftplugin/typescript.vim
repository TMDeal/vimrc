function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('jsdoc')
            let g:leader_map.m.D = ['JsDoc', 'JsDoc']
        endif
        if dein#tap('js-alternate')
            let g:leader_map.m.a = ['call js_alternate#run()', 'alternate file']
        endif
        if dein#tap('nvim-typescript')
            let g:leader_map.m.s = {'name': '[tsserver]'}
            let g:leader_map.m.s.s = ['TSStart', 'start']
            let g:leader_map.m.s.S = ['TSStop', 'stop']
            let g:leader_map.m.s.R = ['TSRestart', 'restart']

            let g:leader_map.m.d = ['TSDef', 'goto definition']
            let g:leader_map.m.t = ['TSTypeDef', 'goto typedef']
            let g:leader_map.m.R = ['TSRefs', 'list references']
            let g:leader_map.m.r = ['TSRename', 'rename under cursor']
            let g:leader_map.m.i = ['TSImport', 'import under cursor']
            let g:leader_map.m.e = ['TSEditConfig', 'edit config']
        endif
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'typescript' | call s:SetLeaderGuideMappings() | endif
augroup END

setlocal indentkeys+=0.
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
