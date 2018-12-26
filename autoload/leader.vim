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

    let g:leader_map.f   = {'name': '[fzf]'}
    let g:leader_map.o   = {'name': '[open]'}
    let g:leader_map.g   = {'name': '[git]'}
    let g:leader_map.w   = {'name': '[window]'}
    let g:leader_map.T   = {'name': '[tabs]'}
    let g:leader_map.t   = {'name': '[tree]'}
    let g:leader_map.y   = {'name': '[yankring]'}
endfunction
