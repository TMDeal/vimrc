if dein#tap('doxygen')
    let g:DoxygenToolkit_authorName='Trent Deal'
    let g:DoxygenToolkit_licenseTag=''
    let g:DoxygenToolkit_briefTag_pre="@Brief  "
    let g:DoxygenToolkit_paramTag_pre="@Param "
    let g:DoxygenToolkit_returnTag="@Returns   "
endif

if dein#tap('jsdoc')
    let g:jsdoc_allow_input_prompt=1
    let g:jsdoc_input_description=1
    let g:jsdoc_enable_es6=1
endif
