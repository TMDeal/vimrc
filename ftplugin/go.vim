function! s:SetLeaderGuideMappings()
    call functions#InitLeaderModeMap()

    if dein#tap('leader-guide')
        if dein#tap('go')
            let g:leader_map.m.t = ['GoBuildTags', 'build tags']

            if dein#tap('fzf')
                let g:leader_map.m.d = ['GoDecls', 'show declarations in file']
                let g:leader_map.m.D = ['GoDeclsDir', 'show declarations in dir']
            endif

            let g:leader_map.m.g = {'name': '[go]'}
            let g:leader_map.m.g.r = ['GoRun!', 'run']
            let g:leader_map.m.g.b = ['GoBuild!', 'build']
            let g:leader_map.m.g.i = ['GoInstall!', 'install']
            let g:leader_map.m.g.g = ['GoGenerate!', 'generate']

            let g:leader_map.m.i = {'name': '[info]'}
            let g:leader_map.m.i.i = ['GoInfo', 'info']
            let g:leader_map.m.i.D = ['GoDescribe', 'describe']
            let g:leader_map.m.i.f = ['GoFiles', 'files']
            let g:leader_map.m.i.d = ['GoDeps', 'dependencies']
            let g:leader_map.m.i.I = ['GoImplements', 'show implementations']
            let g:leader_map.m.i.c = ['GoCallees', 'show callees']
            let g:leader_map.m.i.C = ['GoCallers', 'show callers']
            let g:leader_map.m.i.v = ['GoFreevars', 'free variables']
            let g:leader_map.m.i.p = ['GoChannelPeers', 'channel peers']
            let g:leader_map.m.i.r = ['GoReferrers', 'show referrers']
            let g:leader_map.m.i.s = ['GoSameIdsToggle', 'toggle show same ids']

            let g:leader_map.m.r = {'name': '[refactor]'}
            let g:leader_map.m.r.r = ['GoRename', 'rename']
            let g:leader_map.m.r.i = ['GoImpl', 'implement interface']
            let g:leader_map.m.r.t = ['GoAddTags', 'add struct tags']
            let g:leader_map.m.r.T = ['GoRemoveTags', 'remove struct tags']
            let g:leader_map.m.r.k = ['GoKeyify', 'keyify struct']

            let g:leader_map.m.f = {'name': '[format]'}
            let g:leader_map.m.f.f = ['GoFmt', 'gofmt']
            let g:leader_map.m.f.a = ['AsmFmt', 'asmfmt']

            let g:leader_map.m.l = {'name': '[lint]'}
            let g:leader_map.m.l.L = ['GoMetaLinter', 'meta lint']
            let g:leader_map.m.l.l = ['GoLint', 'golint']
            let g:leader_map.m.l.v = ['GoVet!', 'go vet']
            let g:leader_map.m.l.e = ['GoErrCheck', 'errcheck']

            let g:leader_map.m.a = {'name': '[alternate]'}
            let g:leader_map.m.a.h = ['call go#alternate#Switch(1, "edit")', 'here']
            let g:leader_map.m.a.v = ['call go#alternate#Switch(1, "vsplit")', 'vertical split']
            let g:leader_map.m.a.s = ['call go#alternate#Switch(1, "split")', 'horizontal split']

            let g:leader_map.m.I = {'name': '[import]'}
            let g:leader_map.m.I.I = ['GoImports', 'add/remove']
            let g:leader_map.m.I.i = ['call functions#ExecuteWithInput("GoImport!", "package", "customlist,go#package#Complete")', 'import']
            let g:leader_map.m.I.a = ['call functions#ExecuteWithInput("GoImportAs", "package as", "customlist,go#package#Complete")', 'import as']
            let g:leader_map.m.I.d = ['call functions#ExecuteWithInput("GoDrop", "package", "customlist,go#package#Complete")', 'drop']

            let g:leader_map.m.t = {'name': '[test]'}
            let g:leader_map.m.t.a = ['GoTest', 'test all']
            let g:leader_map.m.t.f = ['GoTestFunc', 'test function']
            let g:leader_map.m.t.b = ['GoTestCompile', 'test compile']
            let g:leader_map.m.t.c = ['GoCoverage!', 'coverage']
            let g:leader_map.m.t.B = ['GoCoverageBrowser!', 'coverage browser']
            let g:leader_map.m.t.C = ['GoCoverageClear', 'clear coverage']
        endif
    endif
endfunction

augroup my_autocmds
    au BufEnter * if &ft ==# 'go' | call s:SetLeaderGuideMappings() | endif
augroup END

if dein#tap('go')
    " let g:go_template_autocreate=0
    let g:go_disable_autoinstall=0
    let g:go_auto_type_info=0
    let g:go_metalinter_autosave=0
    let g:go_gocode_unimported_packages=1
    let g:go_fmt_command="goimports"
    let g:go_list_height=5

    let g:go_highlight_operators=1
    let g:go_highlight_functions=1
    let g:go_highlight_methods=1
    let g:go_highlight_types=1
    let g:go_highlight_fields=1
    let g:go_highlight_build_constraints=1
    let g:go_highlight_generate_tags=1

    let g:go_fmt_fail_silently=1
    let g:go_fmt_options={
                \'gofmt': '-s'
                \}

    if has('nvim')
        let g:go_term_enabled=1
        let g:go_term_height=30
        let g:go_term_width=30
        let g:go_term_mode='vsplit'
    endif
endif

if dein#tap('tagbar')
    let g:tagbar_type_go={
                \'ctagstype' : 'go',
                \'kinds'     : [
                \'p:package',
                \'i:imports:1',
                \'c:constants',
                \'v:variables',
                \'t:types',
                \'n:interfaces',
                \'w:fields',
                \'e:embedded',
                \'m:methods',
                \'r:constructor',
                \'f:functions'
                \],
                \'sro' : '.',
                \'kind2scope' : {
                \'t' : 'ctype',
                \'n' : 'ntype'
                \},
                \'scope2kind' : {
                \'ctype' : 't',
                \'ntype' : 'n'
                \},
                \'ctagsbin'  : 'gotags',
                \'ctagsargs' : '-sort -silent'
                \}
endif
