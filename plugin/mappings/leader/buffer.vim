if dein#tap('leader-guide')
    if dein#tap('buffergator')
        let g:leader_map.b.b = ['BuffergatorToggle', 'Buffergator']
        let g:leader_map.b[']'] = ['BuffergatorMruCycleNext', 'next buffer']
        let g:leader_map.b['['] = ['BuffergatorMruCyclePrev', 'previous buffer']
    endif
endif
