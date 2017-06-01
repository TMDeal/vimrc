if dein#tap('leader-guide')
    let g:leader_map.w['-'] = ['split', 'split horizontal']
    let g:leader_map.w['\'] = ['vsplit', 'split vertical']
    let g:leader_map.w.h = ['wincmd h', 'left split']
    let g:leader_map.w.H = ['wincmd H', 'move split left']
    let g:leader_map.w.j = ['wincmd j', 'bottom split']
    let g:leader_map.w.J = ['wincmd J', 'move split down']
    let g:leader_map.w.k = ['wincmd k', 'top split']
    let g:leader_map.w.K = ['wincmd K', 'move split up']
    let g:leader_map.w.l = ['wincmd l', 'right split']
    let g:leader_map.w.L = ['wincmd L', 'move split right']
    let g:leader_map.w.m = ['wincmd o', 'maximize split']
    if has('nvim')
        :tnoremap <Esc> <C-\><C-n>
        let g:leader_map['!'] = ['below 10sp term://$SHELL', 'shell']
    endif
endif
