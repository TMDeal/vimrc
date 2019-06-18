function! leader#SetupMode()
    let g:leader_map.m = {'name': '[mode]'}
endfunction

function! leader#ClearMode()
    if has_key(g:leader_map, 'm')
        call remove(g:leader_map, 'm')
    endif
endfunction

function! leader#Init()
    let g:leader_map     = {}

    let g:leader_map.p   = {'name': '[coc]'}
    let g:leader_map.g   = {'name': '[git]'}
    let g:leader_map.w   = {'name': '[window]'}
    let g:leader_map.c   = {'name': '[tags]'}
    let g:leader_map.t   = {'name': '[testing]'}
    let g:leader_map.y   = {'name': '[yankring]'}

    let g:leader_map.n   = ['NERDTreeToggle', 'NERDTree']
endfunction
