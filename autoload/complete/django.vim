function! s:DjangoGoTo(ArgLead, CmdLine, CursorPos) abort
    " Check before continuing
    if !filereadable(g:pony_manage_filename)
        return []
    endif

    let l:goto_complete_dict = {
                \ "admin"    : "admin.py",
                \ "models"   : "models.py",
                \ "settings" : "settings.py",
                \ "tests"    : "tests.py",
                \ "urls"     : "urls.py",
                \ "views"    : "views.py"
                \ }

    let l:goto_possible_keys = keys(l:goto_complete_dict)


    " Check that there is a Goto defined for the given command
    let l:cmd_name = split(split(a:CmdLine, " ")[0], g:pony_prefix)[0]
    let l:goto_key_index = match(l:goto_possible_keys, l:cmd_name)
    if l:goto_key_index == -1
        return []
    endif
    let l:goto_key = l:goto_possible_keys[l:goto_key_index]
    let l:filename = l:goto_complete_dict[l:goto_key]

    " Using find command, find folders holding python
    " files at "s:goto_complete_dict[s:filename]"
    let l:findcmd = "find */ -type f -name "
                \ . shellescape(l:filename)
                \ . " | sed 's/\\([^\\/]*\\)\\/" . escape(l:filename, './') . "/\\1/g'"
                \ . " | grep " . shellescape(a:ArgLead)
    let l:folders = system(l:findcmd)
    return split(l:folders, "\n")
endfunction

function! complete#django#Manage(ArgLead, CmdLine, CursorPos) abort
    " Check before continuing
    if !filereadable(g:pony_manage_filename)
        return []
    endif

    " Actually list commands
    let l:list_cmd = s:manage_cmd()
                \ . " help --commands"
                \ . " | grep " . shellescape(a:ArgLead)
    let l:commands = system(l:list_cmd)
    return split(l:commands, "\n")
endfunction

function! complete#django#GoToAdmin(ArgLead, CmdLine, CursorPos) abort
    return s:DjangoGoTo(a:ArgLead, g:pony_prefix . "admin " . a:ArgLead, a:CursorPos)
endfunction!

function! complete#django#GoToModels(ArgLead, CmdLine, CursorPos) abort
    return s:DjangoGoTo(a:ArgLead, g:pony_prefix . "models " . a:ArgLead, a:CursorPos)
endfunction!

function! complete#django#GoToSettings(ArgLead, CmdLine, CursorPos) abort
    return s:DjangoGoTo(a:ArgLead, g:pony_prefix . "settings " . a:ArgLead, a:CursorPos)
endfunction!

function! complete#django#GoToTests(ArgLead, CmdLine, CursorPos) abort
    return s:DjangoGoTo(a:ArgLead, g:pony_prefix . "tests " . a:ArgLead, a:CursorPos)
endfunction!

function! complete#django#GoToUrls(ArgLead, CmdLine, CursorPos) abort
    return s:DjangoGoTo(a:ArgLead, g:pony_prefix . "urls " . a:ArgLead, a:CursorPos)
endfunction!

function! complete#django#GoToViews(ArgLead, CmdLine, CursorPos) abort
    return s:DjangoGoTo(a:ArgLead, g:pony_prefix . "views " . a:ArgLead, a:CursorPos)
endfunction!
