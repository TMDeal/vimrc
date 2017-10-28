function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('jsdoc')
            let g:leader_map.m.D = ['JsDoc', 'JsDoc']
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

if dein#tap('nvim-typescript')
    let g:nvim_typescript#max_completion_detail=100
    let g:nvim_typescript#type_info_on_hold=1
endif

setlocal indentkeys+=0.
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
