if dein#tap('leader-guide')
    if dein#tap('denite')
        let g:leader_map.p.f = ['Denite file/rec', 'files']
        let g:leader_map.p.g = ['Denite grep', 'grep']
        let g:leader_map.p.c = ['Denite command', 'command']
        let g:leader_map.p.b = ['Denite buffer', 'buffer']
        let g:leader_map.p.h = ['Denite help', 'help']
        let g:leader_map.p.t = ['Denite tag', 'tags']

        if dein#tap('neoyank')
            let g:leader_map.p.y = ['Denite neoyank', 'neoyank']
        endif

        if dein#tap('unite-location')
            let g:leader_map.p.q = ['Denite quickfix', 'quickfix']
            let g:leader_map.p.l = ['Denite location_list', 'loclist']
        endif

        if dein#tap('denite-git')
            let g:leader_map.p.g = {'name': '[git]'}
            let g:leader_map.p.g.s = ['Denite gitstatus', 'status']
            let g:leader_map.p.g.b = ['Denite gitbranch', 'branch']
            let g:leader_map.p.g.l = ['Denite gitlog', 'log']
            let g:leader_map.p.g.c = ['Denite gitchanged', 'changed']
        endif
    endif
endif
