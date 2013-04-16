" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:    Jeff Lasslett <j3ff@acm.org>
" Last Change:    2001 Jul 28

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolours"

"-----------[term]----------[ctermfg]-----------[ctermbg]------[cterm]---------[guifg]--------[guibg]------[gui]

hi Normal                                                                       guifg=Grey     guibg=black
hi Comment    term=italic    ctermfg=Green                                      guifg=Green                 gui=italic
hi Constant                  ctermfg=Red                                        guifg=Red    
hi Special                   ctermfg=LightRed                                   guifg=Orange
hi Identifier                ctermfg=Grey                                       guifg=Grey   
hi Statement                 ctermfg=Grey                                       guifg=Grey   
hi PreProc                   ctermfg=Magenta                                    guifg=Magenta
hi Type       term=underline                                    cterm=underline guifg=Cyan                  gui=underline
hi Function                                                     cterm=bold      guifg=Cyan                  gui=bold 
hi Repeat                    ctermfg=Grey                                       guifg=Grey 
hi Operator                  ctermfg=Grey                                       guifg=Grey 
hi Ignore                    ctermfg=black                                      guifg=bg
hi Error      term=reverse   ctermfg=White       ctermbg=Red                    guifg=Red
hi Todo       term=standout  ctermfg=Black       ctermbg=Yellow                 guifg=Blue     guibg=Yellow
hi Visual                                                                       guifg=White    guibg=Grey 
" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Repeat
hi link Label           Statement
hi link Keyword         Type
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
