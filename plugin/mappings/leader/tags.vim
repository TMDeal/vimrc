if dein#tap('leader-guide')
    let g:leader_map.c.g = ['execute "!ctags -R " . projectroot#guess()', 'generate tags file']
    let g:leader_map.c.f = ['call feedkeys(":tag ")', 'find tag']

    if dein#tap('tagbar')
        let g:leader_map.c.t = ['TagbarToggle', 'Tagbar']
    endif

    if dein#tap('gutentags')
        let g:leader_map.c.u = ['GutentagsUpdate!', 'update tags']
        let g:leader_map.c.e = ['GutentagsToggleEnabled', 'toggle gutentags']
    endif
endif
