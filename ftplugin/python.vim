function! s:SetLeaderGuideMappings()
    call leader#SetupMode()

    if dein#tap('leader-guide')
        if dein#tap('shebang')
            let g:leader_map.m['!'] = ['ShebangInsert', 'shebang']
        endif

        if dein#tap('jedi')
            let g:leader_map.m.j = {'name': '[jedi]'}
            let g:leader_map.m.j.g = ['call jedi#goto()', 'go to definition or assignment']
            let g:leader_map.m.j.a = ['call jedi#goto_assignments()', 'go to assignment']
            let g:leader_map.m.j.d = ['call jedi#goto_definitions()', 'go to definition']
            let g:leader_map.m.j.r = ['call jedi#rename()', 'rename under cursor']
            let g:leader_map.m.j.u = ['call jedi#usages()', 'show usages']
            let g:leader_map.m.j.k = ['call jedi#show_documentation()', 'documentation']
        endif

        if dein#tap('python-mode')
            if g:pymode_run==1
                let g:leader_map.m.R = ['PymodeRun', 'Run code']
            endif

            if g:pymode_breakpoint==1
                let g:leader_map.m.b = ['call pymode#breakpoint#operate(line('.'))', 'add breakpoint']
            endif

            if g:pymode_virtualenv==1
                let g:leader_map.m.v = ['call feedkeys(":PymodeVirtualenv ")', 'virtualenv']
            endif

            if g:pymode_rope==1
                let g:leader_map.m.r = {'name': '[rope]'}

                let g:leader_map.m.r.n = [
                            \'execute "PymodeRopeNewProject" . projectroot#guess() | let g:pymode_rope_regenerate_on_write=1',
                            \'new rope project']
                let g:leader_map.m.r.u = ['PymodeRopeUndo', 'undo']
                let g:leader_map.m.r.r = ['PymodeRopeRedo', 'redo']

                let g:leader_map.m.r.i = {'name': '[imports]'}
                let g:leader_map.m.r.i.a = ['PymodeRopeAutoImport', 'autoimport']
                let g:leader_map.m.r.i.o = ['call pymode#rope#organize_imports()', 'organize imports']

                let g:leader_map.m.r.G = {'name': '[generate]'}
                let g:leader_map.m.r.G.r = ['PymodeRopeRegenerate', 'generate rope']
                let g:leader_map.m.r.G.f = ['call pymode#rope#generate_function()', 'generate function']
                let g:leader_map.m.r.G.p = ['call pymode#rope#generate_package()', 'generate package']

                let g:leader_map.m.r.r = {'name': '[refactor]'}
                let g:leader_map.m.r.r.r = ['call pymode#rope#rename()', 'rename']
                let g:leader_map.m.r.r.R = ['call pymode#rope#rename_module()', 'rename module']
                let g:leader_map.m.r.r.p = ['call pymode#rope#module_to_package()', 'module to package']
                let g:leader_map.m.r.r.m = ['call pymode#rope#extract_method()', 'extract method']
                let g:leader_map.m.r.r.v = ['call pymode#rope#extract_variable()', 'extract variable']
                let g:leader_map.m.r.r.u = ['call pymode#rope#use_function()', 'use function']
                let g:leader_map.m.r.r.s = ['call pymode#rope#signature()', 'change signature']
                let g:leader_map.m.r.r.M = ['call pymode#rope#move()', 'move']

                let g:leader_map.m.r.g = ['call pymode#rope#goto_definition()', 'goto']
                let g:leader_map.m.r.f = ['call pymode#rope#find_it()', 'find it']

                let g:leader_map.m.r.d = ['call pymode#rope#show_doc()', 'show doc']
            endif
        endif

        if dein#tap('neoformat')
            let g:leader_map.m.f = ['Neoformat yapf', 'format']
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
    " EchoDocDisable

    let g:jedi#completions_enabled=0
    let g:jedi#auto_vim_configuration=0
    let g:jedi#auto_initialization=0
    let g:jedi#show_call_signatures=0
    let g:jedi#show_call_signatures_delay=0
    let g:jedi#popup_on_dot=0
    let g:jedi#popup_select_first=0
    let g:jedi#smart_auto_mappings=1

    let g:jedi#completions_command=''
    let g:jedi#goto_command=''
    let g:jedi#goto_assignments_command=''
    let g:jedi#goto_definitions_command=''
    let g:jedi#documentation_command=''
    let g:jedi#rename_command=''
    let g:jedi#usages_command=''
endif

if dein#tap('python-mode')
    " Common
    let g:pymode=1
    let g:pymode_warnings=0
    let g:pymode_trim_whitespaces=1
    let g:pymode_options_max_line_length=100
    let g:pymode_options_colorcolumn=0
    let g:pymode_quickfix_minheight=3
    let g:pymode_quickfix_maxheight=6

    let g:pymode_python='python3'

    " Indent/Syntax
    let g:pymode_indent=1
    let g:pymode_syntax_all=1

    " Folding
    let g:pymode_folding=0

    " Motions
    let g:pymode_motion=1

    " Documentaion
    let g:pymode_doc=0
    " let g:pymode_doc_bind='K'

    " Virtualenv
    let g:pymode_virtualenv=0
    let g:pymode_virtualenv_path=$VIRTUAL_ENV

    " Run
    let g:pymode_run=1
    let g:pymode_run_bind=''

    " Breakpoints
    let g:pymode_breakpoint=0
    let g:pymode_breakpoint_bind=''
    let g:pymode_breakpoint_cmd=''

    " Lint
    let g:pymode_lint=0

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
    let g:pymode_rope_autoimport_import_after_complete=0
    let g:pymode_rope_autoimport_modules=[]

    let g:pymode_rope_goto_definition_cmd='e'

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
