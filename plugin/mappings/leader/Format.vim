if dein#tap('leader-guide')
    let g:leader_map.F.f = ['Neoformat', 'format file']
    let g:leader_map.F.w = ['%s/\s\+$//', 'remove trailing whitespace']
    let g:leader_map.F.i = ['execute "normal! mqgg=G`q"', 'reindent file']
endif
