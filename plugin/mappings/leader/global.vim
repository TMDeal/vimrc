if dein#tap('leader-guide')
    if has('nvim')
        let g:leader_map['!'] = ['below 10sp term://$SHELL', 'shell']
    endif
endif
