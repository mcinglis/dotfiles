
" Cras Nox - A dark, relaxed colorscheme for Vim
" http://minglis.id.au

set bg=dark
hi clear
syntax reset
let g:colors_name = 'crasnox'

let s:default   = {'gui': 'NONE',    'term': 'NONE'}
let s:grey80    = {'gui': '#303030', 'term': '235'}
let s:grey75    = {'gui': '#3a3a3a', 'term': '236'}
let s:grey70    = {'gui': '#4a4a4a', 'term': '238'}
let s:grey60    = {'gui': '#585858', 'term': '239'}
let s:grey55    = {'gui': '#5e5e5e', 'term': '240'}
let s:grey40    = {'gui': '#969896', 'term': '245'}
let s:grey20    = {'gui': '#c5c8c6', 'term': '250'}
let s:yellow    = {'gui': '#f0c674', 'term': '222'}
let s:orange    = {'gui': '#de935f', 'term': '173'}
let s:red       = {'gui': '#cc6666', 'term': '167'}
let s:purple    = {'gui': '#b294bb', 'term': '139'}
let s:blue      = {'gui': '#81a2be', 'term': '109'}
let s:aqua      = {'gui': '#8abeb7', 'term': '109'}
let s:green     = {'gui': '#b5bd68', 'term': '143'}

let s:foreground = s:grey20
let s:background = s:grey80
let s:window     = s:grey55
let s:selection  = s:grey70
let s:comment    = s:grey40
let s:line       = s:grey75

let s:highlights = {
    \
    \ 'Normal':       {'fg': s:foreground, 'bg': s:background},
    \ 'LineNr':       {'fg': s:selection},
    \ 'NonText':      {'fg': s:selection},
    \ 'SpecialKey':   {'fg': s:selection},
    \ 'Search':       {'fg': s:background, 'bg': s:yellow},
    \ 'TabLine':      {'fg': s:window, 'bg': s:foreground, 'attr': 'reverse'},
    \ 'TabLineFill':  {'fg': s:window, 'bg': s:foreground, 'attr': 'reverse'},
    \ 'StatusLine':   {'fg': s:window, 'bg': s:yellow, 'attr': 'reverse'},
    \ 'StatusLineNC': {'fg': s:window, 'bg': s:foreground, 'attr': 'reverse'},
    \ 'VertSplit':    {'fg': s:window, 'bg': s:window, 'attr': 'none'},
    \ 'Visual':       {'bg': s:selection},
    \ 'Directory':    {'fg': s:blue},
    \ 'ModeMsg':      {'fg': s:green},
    \ 'MoreMsg':      {'fg': s:green},
    \ 'Question':     {'fg': s:green},
    \ 'WarningMsg':   {'fg': s:red},
    \ 'MatchParen':   {'bg': s:selection},
    \ 'Folded':       {'fg': s:comment, 'bg': s:background},
    \ 'FoldColumn':   {'bg': s:background},
    \ 'CursorLine':   {'bg': s:line, 'attr': 'none'},
    \ 'CursorColumn': {'bg': s:line, 'attr': 'none'},
    \ 'PMenu':        {'fg': s:foreground, 'bg': s:selection, 'attr': 'none'},
    \ 'PMenuSel':     {'fg': s:foreground, 'bg': s:selection, 'attr': 'reverse'},
    \ 'SignColumn':   {'bg': s:background, 'attr': 'none'},
    \ 'ColorColumn':  {'bg': s:line, 'attr': 'none'},
    \
    \ 'Comment':      {'fg': s:comment},
    \ 'Todo':         {'fg': s:comment, 'bg': s:default},
    \ 'Title':        {'fg': s:comment},
    \ 'Identifier':   {'fg': s:red, 'attr': 'none'},
    \ 'Statement':    {'fg': s:purple},
    \ 'Conditional':  {'fg': s:purple},
    \ 'Repeat':       {'fg': s:purple},
    \ 'Structure':    {'fg': s:blue},
    \ 'Function':     {'fg': s:blue},
    \ 'Constant':     {'fg': s:orange},
    \ 'Boolean':      {'fg': s:orange},
    \ 'Keyword':      {'fg': s:orange},
    \ 'String':       {'fg': s:green},
    \ 'Delimiter':    {'fg': s:yellow},
    \ 'Special':      {'fg': s:yellow},
    \ 'PreProc':      {'fg': s:purple},
    \ 'Operator':     {'fg': s:purple, 'attr': 'none'},
    \ 'Type':         {'fg': s:yellow, 'attr': 'none'},
    \ 'Define':       {'fg': s:purple, 'attr': 'none'},
    \ 'Include':      {'fg': s:blue},
    \
    \ 'vimBracket':   {'fg': s:foreground},
    \ 'vimIskSep':    {'fg': s:foreground},
    \ 'vimParenSep':  {'fg': s:foreground},
    \ 'vimSep':       {'fg': s:foreground},
    \
    \ 'shQuote':      {'fg': s:green},
    \
    \ 'pythonFunction':    {'fg': s:blue, 'attr': 'bold'},
    \ 'pythonBuiltinFunc': {'fg': s:orange},
    \ 'pythonExClass':     {'fg': s:red},
    \ 'pythonClass':       {'fg': s:red},
    \ 'pythonConstant':    {'fg': s:blue},
    \
    \ 'rubyStringDelimiter':  {'fg': s:green},
    \ 'rubyFunction':         {'fg': s:blue, 'attr': 'bold'},
    \
\ }

for key in keys(s:highlights)
    let s:group = s:highlights[key]
    if has_key(s:group, 'fg')
        let s:fg = s:group['fg']
        exec 'hi '.key.' ctermfg='.s:fg['term'].' guifg='.s:fg['gui']
    endif
    if has_key(s:group, 'bg')
        let s:bg = s:group['bg']
        exec 'hi '.key.' ctermbg='.s:bg['term'].' guibg='.s:bg['gui']
    endif
    if has_key(s:group, 'attr')
        let s:attr = s:group['attr']
        exec 'hi '.key.' cterm='.s:attr.' gui='.s:attr
    endif
endfor

