" 
" ##       ##   #########   ##       ##   ######### 
" ####   ####  ###     ###  ####   ####  ###     ###
" ## ## ## ##  ##       ##  ## ## ## ##  ##       ##
" ##  ###  ##  ##       ##  ##  ###  ##  ##       ##
" ##       ##  ###     ###  ##       ##  ###     ###
" ##       ##   #########   ##       ##   ######### 
"
" Name:       momo.vim
" Mantainer:  Miu <https://github.com/miublue>
" Repository: https://github.com/miublue/momo.vim
" License:    MIT
"
" Minimalistic dark theme for Vim.

set background=dark
highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='momo'

if !exists('g:momo_background_color')
    let g:momo_background_color = ['#000000', 16]
endif

if !exists('g:momo_foreground_color')
    let g:momo_foreground_color = ['#eeeeee', 255]
endif

if !exists('g:momo_highlight_color')
    let g:momo_highlight_color = ['#87d7ff', 117]
endif

if !exists('g:momo_comment_color')
    let g:momo_comment_color = ['#808080', 244]
endif

if !exists('g:momo_transparent_background')
    let g:momo_transparent_background = 0
endif

if !exists('g:momo_italic_comments')
    let g:momo_italic_comments = 0
endif

if !exists('g:momo_bold_keywords')
    let g:momo_bold_keywords = 0
endif

let s:bg_col = g:momo_background_color
let s:fg_col = g:momo_foreground_color
let s:hl_col = g:momo_highlight_color
let s:cm_col = g:momo_comment_color
let s:fn_col = exists('g:momo_function_color')? g:momo_function_color : g:momo_foreground_color
let s:cs_col = exists('g:momo_constant_color')? g:momo_constant_color : g:momo_highlight_color
let s:none   = ['NONE', 'NONE']

let s:c_attr = g:momo_italic_comments? 'ITALIC' : 'NONE'
let s:k_attr = g:momo_bold_keywords? 'BOLD' : 'NONE'

function! s:hl(item, foreground, background, style)
    let cmd  = 'highlight ' . a:item
    let cmd .= ' guifg=' . a:foreground[0] . ' ctermfg=' . a:foreground[1]
    let cmd .= ' guibg=' . a:background[0] . ' ctermbg=' . a:background[1]
    let cmd .= ' gui=' . a:style . ' cterm=' . a:style
    execute cmd
endfunction

" Basic
call s:hl('Normal',          s:fg_col, g:momo_transparent_background? s:none : s:bg_col, 'NONE')
call s:hl('Cursor',          s:fg_col, s:none,   'NONE')
call s:hl('Folded',          s:fg_col, s:none,   'REVERSE')
call s:hl('WildMenu',        s:fg_col, s:none,   'REVERSE')
call s:hl('MatchParen',      s:hl_col, s:bg_col, 'UNDERLINE')

" Misc
call s:hl('Directory',       s:hl_col, s:none,   'NONE')
call s:hl('Ignore',          s:hl_col, s:none,   'NONE')
call s:hl('NonText',         s:cm_col, s:none,   'NONE')
call s:hl('SpecialKey',      s:hl_col, s:none,   'NONE')
call s:hl('UNDERLINEd',      s:hl_col, s:none,   'UNDERLINE')
call s:hl('Title',           s:hl_col, s:none,   'NONE')

" Status Line
call s:hl('StatusLine',      s:fg_col, s:none,   'UNDERLINE')
call s:hl('StatusLineNC',    s:cm_col, s:none,   'UNDERLINE')
call s:hl('VertSplit',       s:fg_col, s:none,   'NONE')

" Lines
call s:hl('CursorColumn',    s:none,   s:none,   'NONE')
call s:hl('CursorLine',      s:none,   s:none,   'NONE')
call s:hl('LineNr',          s:cm_col, s:none,   'NONE')
call s:hl('CursorLineNr',    s:hl_col, s:none,   s:k_attr)

" Visual
call s:hl('Visual',          s:fg_col, s:bg_col, 'REVERSE')
call s:hl('VisualNOS',       s:fg_col, s:bg_col, 'REVERSE')
call s:hl('Search',          s:bg_col, s:hl_col, 'NONE')
call s:hl('IncSearch',       s:bg_col, s:fg_col, 'NONE')

" Messages
call s:hl('WarningMsg',      s:hl_col, s:none,   'BOLD')
call s:hl('ErrorMsg',        s:hl_col, s:none,   'BOLD')
call s:hl('ModeMsg',         s:hl_col, s:none,   'BOLD')
call s:hl('MoreMsg',         s:hl_col, s:none,   'BOLD')
call s:hl('Error',           s:hl_col, s:none,   'BOLD')

" Popup Menu
call s:hl('Pmenu',           s:fg_col, s:bg_col, 'NONE')
call s:hl('PmenuSbar',       s:fg_col, s:bg_col, 'NONE')
call s:hl('PmenuSel',        s:fg_col, s:bg_col, 'REVERSE')
call s:hl('PmenuThumb',      s:fg_col, s:bg_col, 'REVERSE')

" Tab Line
call s:hl('TabLine',         s:fg_col, s:none,   'NONE')
call s:hl('TabLineFill',     s:fg_col, s:none,   'NONE')
call s:hl('TabLineSel',      s:hl_col, s:none,   'UNDERLINE')

" Diffs
call s:hl('DiffChange',      s:hl_col, s:none,   'NONE')
call s:hl('DiffDelete',      s:hl_col, s:none,   'NONE')
call s:hl('DiffAdd',         s:hl_col, s:none,   'NONE')
call s:hl('DiffText',        s:fg_col, s:none,   'NONE')

" Syntax
call s:hl('Comment',         s:cm_col, s:none,   s:c_attr)
highlight! link Todo         Comment

call s:hl('Identifier',      s:fg_col, s:none,   'NONE')
call s:hl('Function',        s:fn_col, s:none,   'NONE')

call s:hl('Constant',        s:cs_col, s:none,   'NONE')
highlight! link Number       Constant
highlight! link String       Constant
highlight! link Character    Constant
highlight! link Boolean      Constant
highlight! link Float        Constant

call s:hl('Operator',        s:hl_col, s:none,   'NONE')
call s:hl('Keyword',         s:hl_col, s:none,   s:k_attr)
highlight! link Statement    Keyword
highlight! link Structure    Keyword
highlight! link Conditional  Keyword
highlight! link Exception    Keyword
highlight! link Tag          Keyword
highlight! link Label        Keyword
highlight! link Special      Keyword
highlight! link SpecialChar  Keyword

call s:hl('Type',            s:hl_col, s:none,   s:k_attr)
highlight! link TypeDef      Type
highlight! link StorageClass Type

call s:hl('PreProc',         s:hl_col, s:none,   s:k_attr)
highlight! link PreCondit    PreProc
highlight! link Include      PreProc
highlight! link Define       PreProc
highlight! link Macro        PreProc

