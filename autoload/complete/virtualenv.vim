function! complete#virtualenv#Env(ArgLead, CmdLine, CursorPos)
    return virtualenv#names(a:ArgLead)
endfunction
