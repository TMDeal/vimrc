if dein#tap('leader-guide')
    let g:leader_map.T.s = ['tabs', 'show']
    let g:leader_map.T.e = ['call feedkeys(":tabedit ")', 'edit']
    let g:leader_map.T.t = ['tabnew', 'new']
    let g:leader_map.T.n = ['tabnext', 'next']
    let g:leader_map.T.p = ['tabprevious', 'previous']
    let g:leader_map.T.L = ['tablast', 'last']
    let g:leader_map.T.F = ['tabfirst', 'first']
    let g:leader_map.T.f = ['call feedkeys(":tabmove ")', 'goto']
endif
