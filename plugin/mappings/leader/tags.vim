if dein#tap('leader-guide')
    let g:leader_map.t.f = ['call feedkeys(":tag ")', 'find tag']

    if dein#tap('tagbar')
        let g:leader_map.t.t = ['TagbarToggle', 'Tagbar']
    endif

    if dein#tap('gutentags')
        let g:leader_map.t.u = ['GutentagsUpdate!', 'update tags']
    endif
endif
