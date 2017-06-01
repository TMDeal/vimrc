if dein#tap('leader-guide')
    if dein#tap('yankring')
        let g:leader_map.y.E = ['YRToggle 1', 'enable yankring']
        let g:leader_map.y.D = ['YRToggle 0', 'disable yankring']
        let g:leader_map.y.c = ['YRClear', 'clear yankring']
        let g:leader_map.y.y = ['YRShow', 'show yankring']
        let g:leader_map.y.g = ['YRGetElem', 'get element']
        let g:leader_map.y.P = ['call functions#ExecuteWithInput("YRPush", "push")', 'push to yankring']
        let g:leader_map.y.p = ['call functions#ExecuteWithInput("YRPop", "pop")', 'pop from yankring']
    endif
endif
