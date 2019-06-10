if dein#tap('committia')
    let g:committia_hooks = {}
    function! g:committia_hooks.edit_open(info)
        " Scroll the diff window from insert mode
        " Map <C-n> and <C-p>
        imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
        imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
    endfunction
endif

if dein#tap('fugitive')
    if dein#tap('leader-guide')
        let g:leader_map.g.s = ['Gstatus', 'status']
        let g:leader_map.g.c = ['Gcommit -v -q', 'commit']
        let g:leader_map.g.t = ['Gcommit -v -q %:p', 'commit file']
        let g:leader_map.g.d = ['Gdiff', 'diff']
        let g:leader_map['g']['['] = [':diffget //2', 'keep left']
        let g:leader_map['g'][']'] = [':diffget //3', 'keep right']
        let g:leader_map.g.e = ['Gedit', 'edit index']
        let g:leader_map.g.r = ['Gread', 'checkout']
        let g:leader_map.g.a = ['Gwrite', 'add']
        let g:leader_map.g.l = ['Glog', 'log']
        let g:leader_map.g.p = ['call feedkeys(":Ggrep ")', 'grep']
        let g:leader_map.g.m = ['call feedkeys(":Gmove ")', 'move']
        let g:leader_map.g.b = ['call feedkeys(":Git branch ")', 'branch']
    endif
endif
