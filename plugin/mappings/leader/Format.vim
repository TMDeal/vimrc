if dein#tap('leader-guide')
    let g:leader_map.F.w = ['%s/\s\+$//', 'remove trailing whitespace']
    let g:leader_map.F.i = ['execute "normal! gg=G"', 'reindent file']
endif
