function! s:sub(str,pat,rep) abort
  return substitute(a:str,'\v\C'.a:pat,a:rep,'')
endfunction

function! complete#fugitive#Git(ArgLead, CmdLine, CursorPos) abort
  if strpart(a:CmdLine, 0, a:CursorPos) !~# ' [[:alnum:]-]\+ '
    let cmds = fugitive#git_commands()
    return filter(sort(cmds+keys(fugitive#repo().aliases())), 'strpart(v:val, 0, strlen(a:ArgLead)) ==# a:ArgLead')
  else
    return fugitive#repo().superglob(a:ArgLead)
  endif
endfunction

function! complete#fugitive#Dir(ArgLead, CmdLine, CursorPos) abort
  let matches = fugitive#repo().dirglob(a:ArgLead)
  return matches
endfunction

function! complete#fugitive#Edit(ArgLead, CmdLine, CursorPos) abort
  return map(fugitive#repo().superglob(a:ArgLead), 'fnameescape(v:val)')
endfunction

function! complete#fugitive#EditRun(ArgLead, CmdLine, CursorPos) abort
  if a:L =~# '^\w\+!'
    return complete#fugitive#Git(a:ArgLead, a:CmdLine, a:CursorPos)
  else
    return fugitive#repo().superglob(a:A)
  endif
endfunction

function! complete#fugitive#Commit(ArgLead, CmdLine, CursorPos) abort
  if a:ArgLead =~ '^-' || type(a:ArgLead) == type(0) " a:ArgLead is 0 on :Gcommit -<Tab>
    let args = ['-C', '-F', '-a', '-c', '-e', '-i', '-m', '-n', '-o', '-q', '-s', '-t', '-u', '-v', '--all', '--allow-empty', '--amend', '--author=', '--cleanup=', '--dry-run', '--edit', '--file=', '--fixup=', '--include', '--interactive', '--message=', '--no-verify', '--only', '--quiet', '--reedit-message=', '--reuse-message=', '--signoff', '--squash=', '--template=', '--untracked-files', '--verbose']
    return filter(args,'v:val[0 : strlen(a:ArgLead)-1] ==# a:ArgLead')
  else
    return fugitive#repo().superglob(a:ArgLead)
  endif
endfunction

function! complete#fugitive#Remote(ArgLead, CmdLine, CursorPos) abort
  let remote = matchstr(a:CmdLine, ' \zs\S\+\ze ')
  if !empty(remote)
    let matches = split(fugitive#repo().git_chomp('ls-remote', remote), "\n")
    call filter(matches, 'v:val =~# "\t" && v:val !~# "{"')
    call map(matches, 's:sub(v:val, "^.*\t%(refs/%(heads/|tags/)=)=", "")')
  else
    let matches = split(fugitive#repo().git_chomp('remote'), "\n")
  endif
  return join(matches, "\n")
endfunction

function! complete#fugitive#Revision(ArgLead, CmdLine, CursorPos) abort
  return fugitive#repo().git_chomp('rev-parse', '--symbolic', '--branches', '--tags', '--remotes')
        \ . "\nHEAD\nFETCH_HEAD\nORIG_HEAD"
endfunction

function! complete#fugitive#Move(ArgLead, CmdLine, CursorPos) abort
  if a:ArgLead =~ '^/'
    return fugitive#repo().superglob(a:ArgLead)
  else
    let matches = split(glob(a:ArgLead . '*'),"\n")
    call map(matches,'v:val !~ "/$" && isdirectory(v:val) ? v:val."/" : v:val')
    return matches
  endif
endfunction
