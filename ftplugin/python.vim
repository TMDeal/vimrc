function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('shebang')
            let g:leader_map.m['!'] = ['ShebangInsert', 'shebang']
        endif

        if dein#tap('jedi')
            let g:leader_map.m.g = ['jedi#goto()', 'go to definition or assignment']
            let g:leader_map.m.a = ['jedi#goto_assignments()', 'go to assignment']
            let g:leader_map.m.d = ['jedi#goto_definitions()', 'go to definition']
            let g:leader_map.m.r = ['jedi#rename()', 'rename under cursor']
            let g:leader_map.m.h = ['jedi#usages()', 'show usages']
        endif

        if dein#tap('pony')
            if exists('b:is_django')
                let g:leader_map.m.p = {'name': '[django]'}
                let g:leader_map.m.p.a = ['call feedkeys(":Dadmin ")', 'GoTo admin']
                let g:leader_map.m.p.m = ['call feedkeys(":Dmodels ")', 'GoTo models']
                let g:leader_map.m.p.s = ['call feedkeys(":Dsettings ")', 'GoTo settings']
                let g:leader_map.m.p.t = ['call feedkeys(":Dtests ")', 'GoTo tests']
                let g:leader_map.m.p.u = ['call feedkeys(":Durls ")', 'GoTo urls']
                let g:leader_map.m.p.v = ['call feedkeys(":Dviews ")', 'GoTo views']
                let g:leader_map.m.p.M = ['call feedkeys(":Dmanage ")', 'manage']
            endif
        endif

        if dein#tap('python-mode')
            if g:pymode_run==1
                let g:leader_map.m.R = ['PymodeRun', 'Run code']
            endif

            if g:pymode_breakpoint==1
                let g:leader_map.m.b = ['call pymode#breakpoint#operate(line('.'))', 'add breakpoint']
            endif

            if g:pymode_rope==1
                let g:leader_map.m.r = {'name': '[rope]'}

                let g:leader_map.m.r.N = [
                            \'execute "PymodeRopeNewProject" . projectroot#guess() | let g:pymode_rope_regenerate_on_write=1',
                            \'new rope project']
                let g:leader_map.m.r.C = ['PymodeRopeRegenerate', 'recache']
                let g:leader_map.m.r.a = ['PymodeRopeAutoImport', 'rope autoimport']
                let g:leader_map.m.r.u = ['PymodeRopeUndo', 'undo']
                let g:leader_map.m.r.R = ['PymodeRopeRedo', 'redo']
                let g:leader_map.m.r.n = ['PymodeRopeNewProject', 'new']
                let g:leader_map.m.r.G = ['PymodeRopeRegenerate', 'regenerate']

                let g:leader_map.m.r.M = ['call pymode#rope#move()', 'move']
                let g:leader_map.m.r.r = ['call pymode#rope#rename()', 'rename']
                let g:leader_map.m.r.F = ['call pymode#rope#use_function()', 'use function']
                let g:leader_map.m.r.g = ['call pymode#rope#goto_definition()', 'goto']
                let g:leader_map.m.r.s = ['call pymode#rope#signature()', 'change signature']
                let g:leader_map.m.r.m = ['call pymode#rope#rename_module()', 'rename module']
                let g:leader_map.m.r.p = ['call pymode#rope#module_to_package()', 'module to package']
                let g:leader_map.m.r.f = ['call pymode#rope#extract_method()', 'extract method']
                let g:leader_map.m.r.v = ['call pymode#rope#extract_variable()', 'extract variable']
            endif
        endif

        if dein#tap('python-virtualenv')
            let g:leader_map.m.v = {'name': '[virtualenv]'}
            let g:leader_map.m.v.l = ['VirtualEnvList', 'show virtualenvs']
            let g:leader_map.m.v.d = ['VirtualEnvDeactivate', 'deactivate virtualenv']
            let g:leader_map.m.v.a = ['call feedkeys(":VirtualEnvActivate ")', 'activate virtualenv']
        endif

        if dein#tap('pydocstring')
            let g:leader_map.m.D = ['Pydocstring', 'pydocstring']
        endif

        if dein#tap('impsort')
            let g:leader_map.m.I = ['ImpSort!', 'sort imports']
        endif
    endif
endfunction

function! s:RopeProjectIfExistsSettings()
    if isdirectory(projectroot#guess() . '/.ropeproject')
        let g:pymode_rope_regenerate_on_write=1
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'python' | call s:SetLeaderGuideMappings() | endif
    au BufEnter * if &ft ==# 'python' | call s:RopeProjectIfExistsSettings() | endif
augroup END

if dein#tap('jedi')
    let g:jedi#completions_enabled=0
    let g:jedi#auto_vim_configuration=0
    let g:jedi#show_call_signatures=0
    let g:jedi#show_call_signatures_delay=0

    let g:jedi#documentation_command='K'

    let g:jedi#completions_command=''
    let g:jedi#goto_command=''
    let g:jedi#goto_assignments_command=''
    let g:jedi#goto_definitions_command=''
    let g:jedi#rename_command=''
    let g:jedi#usages_command=''
endif

if dein#tap('python-mode')
    " Common
    let g:pymode=1
    let g:pymode_python='python3'
    let g:pymode_warnings=0
    let g:pymode_trim_whitespaces=1
    let g:pymode_options_max_line_length=100
    let g:pymode_options_colorcolumn=0
    let g:pymode_quickfix_minheight=3
    let g:pymode_quickfix_maxheight=6

    " Indent/Syntax
    let g:pymode_indent=1
    let g:pymode_syntax_all=1

    " Folding
    let g:pymode_folding=0

    " Motions
    let g:pymode_motion=1

    " Documentaion
    let g:pymode_doc=1
    let g:pymode_doc_bind='K'

    " Virtualenv
    let g:pymode_virtualenv=0
    let g:pymode_virtualenv_path=$VIRTUAL_ENV

    " Run
    let g:pymode_run=1
    let g:pymode_run_bind=''

    " Lint
    let g:pymode_lint=0

    " Breakpoints
    let g:pymode_breakpoint=0
    let g:pymode_breakpoint_bind=''
    let g:pymode_breakpoint_cmd=''

    " Rope
    let g:pymode_rope=0

    let g:pymode_rope_regenerate_on_write=0

    let g:pymode_rope_ropefolder='.ropeproject'
    let g:pymode_rope_project_root=''
    let g:pymode_rope_current=''
    let g:pymode_rope_lookup_project=0

    let g:pymode_rope_completion=0
    let g:pymode_rope_complete_on_dot=0

    let g:pymode_rope_autoimport=1
    let g:pymode_rope_autoimport_import_after_complete=1
    let g:pymode_rope_autoimport_modules=['os', 'shutil', 'datetime']

    let g:pymode_rope_goto_definition_cmd='new'

    let g:pymode_rope_autoimport_bind        = ''
    let g:pymode_rope_completion_bind        = ''
    let g:pymode_rope_goto_definition_bind   = ''
    let g:pymode_rope_show_doc_bind          = ''
    let g:pymode_rope_find_it_bind           = ''
    let g:pymode_rope_organize_imports_bind  = ''
    let g:pymode_rope_rename_bind            = ''
    let g:pymode_rope_rename_module_bind     = ''
    let g:pymode_rope_module_to_package_bind = ''
    let g:pymode_rope_extract_method_bind    = ''
    let g:pymode_rope_extract_variable_bind  = ''
    let g:pymode_rope_inline_bind            = ''
    let g:pymode_rope_move_bind              = ''
    let g:pymode_rope_generate_function_bind = ''
    let g:pymode_rope_generate_class_bind    = ''
    let g:pymode_rope_generate_package_bind  = ''
    let g:pymode_rope_change_signature_bind  = ''
    let g:pymode_rope_use_function_bind      = ''
endif

if dein#tap('pydocstring')
    let g:pydocstring_templates_dir=$EDITOR_ROOT . '/templates/'
    let g:pydocstring_enable_mapping=0
endif
