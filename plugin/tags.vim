if dein#tap('leader-guide')
    let g:leader_map.t.g = ['execute "!ctags -R " . projectroot#guess()', 'generate tags file']
    let g:leader_map.t.f = ['call functions#ExecuteWithInput("tag", "find", "tag")', 'find tag']

    if dein#tap('tagbar')
        let g:leader_map.t.t = ['TagbarToggle', 'Tagbar']
    endif

    if dein#tap('gutentags')
        let g:leader_map.t.u = ['GutentagsUpdate!', 'update tags']
        let g:leader_map.t.e = ['GutentagsToggleEnabled', 'toggle gutentags']
    endif
endif

if dein#tap('tagbar')
    let g:tagbar_autofocus=1
    let g:tagbar_compact=1
    let g:tagbar_show_linenumbers=1
endif

if dein#tap('gutentags')
    let g:gutentags_cache_dir=$EDITOR_ROOT . "/.cache/tags"
    let g:gutentags_project_root=g:root_markers
    let g:gutentags_generate_on_write=1
    let g:gutentags_generate_on_missing=0
    let g:gutentags_generate_on_new=0
endif
