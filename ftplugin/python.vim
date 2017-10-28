function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('shebang')
            let g:leader_map.m['!'] = ['ShebangInsert', 'shebang']
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
                let g:leader_map.m.r.M = ['call pymode#rope#move()', 'move']
                let g:leader_map.m.r.u = ['PymodeRopeUndo', 'undo']
                let g:leader_map.m.r.R = ['PymodeRopeRedo', 'redo']
                let g:leader_map.m.r.r = ['call pymode#rope#rename()', 'rename']
                let g:leader_map.m.r.a = ['PymodeRopeAutoImport', 'rope autoimport']
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
            let g:leader_map.m.v.a = ['call functions#ExecuteWithInput("VirtualEnvActivate", "env", "customlist,complete#virtualenv#Env")', 'activate virtualenv']
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
    else
        let g:pymode_rope_regenerate_on_write=0
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'python' | call s:SetLeaderGuideMappings() | endif
    au BufEnter * if &ft ==# 'python' | call s:RopeProjectIfExistsSettings() | endif
augroup END

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
    " DISABLED
    let g:pymode_virtualenv=0

    " Lint
    " DISABLED
    let g:pymode_lint=0

    " Run
    let g:pymode_run=1
    let g:pymode_run_bind='<leader>mR'

    " Breakpoints
    let g:pymode_breakpoint=0
    let g:pymode_breakpoint_bind=''
    let g:pymode_breakpoint_cmd=''

    " Rope
    let g:pymode_rope=1
    let g:pymode_rope_lookup_project=0
    let g:pymode_rope_project_root=''
    let g:pymode_rope_ropefolder='.ropeproject'
    let g:pymode_rope_completion=0
    let g:pymode_rope_goto_definition_cmd='new'
    call s:RopeProjectIfExistsSettings()

    let g:pymode_rope_show_doc_bind          = ''
    let g:pymode_rope_organize_imports_bind  = ''
    let g:pymode_rope_move_bind              = ''
    let g:pymode_rope_rename_bind            = ''
    let g:pymode_rope_autoimport_bind        = ''
    let g:pymode_rope_use_function_bind      = ''
    let g:pymode_rope_rename_module_bind     = ''
    let g:pymode_rope_extract_method_bind    = ''
    let g:pymode_rope_goto_definition_bind   = ''
    let g:pymode_rope_change_signature_bind  = ''
    let g:pymode_rope_extract_variable_bind  = ''
    let g:pymode_rope_module_to_package_bind = ''
endif

if dein#tap('pydocstring')
    let g:pydocstring_templates_dir=$EDITOR_ROOT . '/templates/'
    let g:pydocstring_enable_mapping=0
endif
