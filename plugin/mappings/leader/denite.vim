if dein#tap('leader-guide')
    if dein#tap('denite')
        let g:leader_map.p.f = ['Denite file/rec', 'files']
        let g:leader_map.p.g = ['Denite grep', 'grep']
        let g:leader_map.p.c = ['Denite command', 'command']
        let g:leader_map.p.b = ['Denite buffer', 'buffer']
        let g:leader_map.p.h = ['Denite help', 'help']
        let g:leader_map.p.t = ['Denite tag', 'tags']
    endif
endif
