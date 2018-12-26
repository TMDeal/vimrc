if dein#tap('leader-guide')
    if dein#tap('tagbar')
        let g:leader_map.t.t = ['TagbarToggle', 'Tagbar']
    endif

    if dein#tap('undotree')
        let g:leader_map.t.u   = ['UndotreeToggle', 'undotree']
    endif

    if dein#tap('nerdtree')
        let g:leader_map.t.n = ['ProjectRootExe NERDTreeToggle', 'NERDTree']
    endif
endif
