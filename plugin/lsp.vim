if dein#tap('lsp')
    let g:LanguageClient_autoStart=1
    let g:LanguageClient_autoStop=1
    let g:LanguageClient_diagnosticsEnable=0
    let g:LanguageClient_diagnosticsList='location'
    let g:LanguageClient_windowLogMessageLevel='Error'
    let g:LanguageClient_serverCommands={}

    " if executable('javascript-typescript-stdio')
    "     let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
    "     let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
    " endif
    if executable('html-languageserver')
        let g:LanguageClient_serverCommands.html = ['html-languageserver', '--stdio']
    endif
    if executable('css-languageserver')
        let g:LanguageClient_serverCommands.css = ['css-languageserver', '--stdio']
        let g:LanguageClient_serverCommands.scss = ['css-languageserver', '--stdio']
    endif
    " if executable('json-languageserver')
    "     let g:LanguageClient_serverCommands.json = ['json-languageserver', '--stdio']
    " endif
    " if executable('pyls')
    "     let g:LanguageClient_serverCommands.python = ['pyls']
    " endif
    if executable('solargraph')
        let g:LanguageClient_serverCommands.ruby = ['tcp://localhost:7658']
        let g:LanguageClient_serverCommands.eruby = ['tcp://localhost:7658']
    endif
endif
