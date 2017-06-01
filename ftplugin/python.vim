function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('jedi')
            let g:leader_map.m.g = ['jedi#goto()', 'go to definition or assignment']
            let g:leader_map.m.a = ['jedi#goto_assignments()', 'go to assignment']
            let g:leader_map.m.i = ['jedi#goto_definitions()', 'go to definition']
            let g:leader_map.m.r = ['jedi#rename()', 'rename under cursor']
            let g:leader_map.m.u = ['jedi#usages()', 'show usages']
        endif
        if dein#tap('python-virtualenv')
            let g:leader_map.m.v = {'name': 'virtualenv'}
            let g:leader_map.m.v.l = ['VirtualEnvList', 'show virtualenvs']
            let g:leader_map.m.v.d = ['VirtualEnvDeactivate', 'deactivate virtualenv']
            let g:leader_map.m.v.a = ['call functions#ExecuteWithInput("VirtualEnvActivate", "env", "customlist,complete#virtualenv#Env")', "activate virtualenv"]
        endif
        if dein#tap('pony')
            if exists('b:is_django')
                let g:leader_map.m.d = {'name': 'django'}
                let g:leader_map.m.d.a = ['call functions#ExecuteWithInput("Dadmin", "app", "customlist,complete#django#GoToAdmin")', 'GoTo admin']
                let g:leader_map.m.d.m = ['call functions#ExecuteWithInput("Dmodels", "app", "customlist,complete#django#GoToModels")', 'GoTo models']
                let g:leader_map.m.d.s = ['call functions#ExecuteWithInput("Dsettings", "app", "customlist,complete#django#GoToSettings")', 'GoTo settings']
                let g:leader_map.m.d.t = ['call functions#ExecuteWithInput("Dtests", "app", "customlist,complete#django#GoToTests")', 'GoTo tests']
                let g:leader_map.m.d.u = ['call functions#ExecuteWithInput("Durls", "app", "customlist,complete#django#GoToUrls")', 'GoTo urls']
                let g:leader_map.m.d.v = ['call functions#ExecuteWithInput("Dviews", "app", "customlist,complete#django#GoToViews")', 'GoTo views']
                let g:leader_map.m.d.M = ['call functions#ExecuteWithInput("Dmanage", "args", "customlist,complete#django#Manage")', 'manage']
            endif
        endif
        if dein#tap('pydocstring')
            let g:leader_map.m.D = ['Pydocstring', 'pydocstring']
        endif
        if dein#tap('impsort')
            let g:leader_map.m.I = ['ImpSort!', 'sort imports']
        endif
    endif
endfunction

call s:SetLeaderGuideMappings()

augroup my_autocmds
    au Filetype python call s:SetLeaderGuideMappings()
augroup END

if dein#tap('jedi')
    let g:jedi#completions_enabled=0
    let g:jedi#auto_vim_configuration=0
    let g:jedi#show_call_signatures=2
    let g:jedi#show_call_signatures_delay=0

    let g:jedi#documentation_command='K'

    let g:jedi#completions_command=''
    let g:jedi#goto_command=''
    let g:jedi#goto_assignments_command=''
    let g:jedi#goto_definitions_command=''
    let g:jedi#rename_command=''
    let g:jedi#usages_command=''
endif

if dein#tap('pydocstring')
    let g:pydocstring_templates_dir=$EDITOR_ROOT . '/templates/'
    let g:pydocstring_enable_mapping=0
endif
