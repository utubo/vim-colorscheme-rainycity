" * rainycity *
" Author: utubo
" Notes:
" Thx: This is based on https://github.com/ggalindezb/vim_colorscheme_template

highlight clear
if exists('syntax_on')
  syntax reset
endif
let s:colors_name = expand('<sfile>:t:r')
let g:colors_name = s:colors_name

" COLORS
"   <type><opacity>
" type:
"   n: normal
"   b: positiv1(blue)
"   g: positiv2(green)
"   y: warn(yellow)
"   r: error(red)
"   c: cyan(for terminal)
"   m: magenta(for terminal)
" opacity:
"   0: 0% Default BG (only n0)
"   1: 20% BG
"   2: 60% Middle FG
"   3: 80% Default FG
"   4: 100% Highlight (eg. b4=cursor,g4=search)
"   9: 100% Highlight on &background == 'light'
if has('gui_running')
  let s:term = 'gui'
  let s:n0 = '#2d3037'
  let s:n1 = '#525456'
  let s:n2 = '#9d9e96'
  let s:n3 = '#c3c3b6'
  let s:n4 = '#e9e8d6'
  let s:b1 = '#324345'
  let s:b2 = '#3d6b62'
  let s:b3 = '#427f70'
  let s:b4 = '#48937f'
  let s:b9 = '#48937f'
  let s:g1 = '#2f4b49'
  let s:g2 = '#35826d'
  let s:g3 = '#389d7f'
  let s:g4 = '#3bb991'
  let s:g9 = '#3bb991'
  let s:y1 = '#444d49'
  let s:y2 = '#73896e' " not used
  let s:y3 = '#8aa781'
  let s:y4 = '#a2c594'
  let s:y9 = '#a2c594'
  let s:r1 = '#4f3d42'
  let s:r2 = '#945858'
  let s:r3 = '#b66663'
  let s:r4 = '#d9746f'
  let s:r9 = '#d9746f'
  let s:c2 = '#397667'
  let s:c4 = '#41a688'
  let s:m2 = '#68615d'
  let s:m4 = '#908377'
else
  set t_Co=256
  let s:term = 'cterm'
  let s:n0 = '236'
  let s:n1 = '240'
  let s:n2 = '247'
  let s:n3 = '250'
  let s:n4 = '187'
  let s:b1 = '237'
  let s:b2 = '66'
  let s:b3 = '66'
  let s:b4 = '72'
  let s:b9 = '72'
  let s:g1 = '237'
  let s:g2 = '72'
  let s:g3 = '72'
  let s:g4 = '72'
  let s:g9 = '72'
  let s:y1 = '232'
  let s:y2 = '65' " not used
  let s:y3 = '108'
  let s:y4 = '151'
  let s:y9 = '151'
  let s:r1 = '238'
  let s:r2 = '95' " not used
  let s:r3 = '131'
  let s:r4 = '167'
  let s:r9 = '167'
  let s:c2 = '221'
  let s:c4 = '221'
  let s:m2 = '222'
  let s:m4 = '222'
endif

if &background == 'light'
  let [s:n0, s:n1, s:n3, s:n4] = [s:n4, s:n3, s:n1, s:n0]
  let [s:b1, s:b3, s:b4] = [s:b3, s:b1, s:b9]
  let [s:g1, s:g3, s:g4] = [s:g3, s:g1, s:g9]
  let [s:y1, s:y3, s:y4] = [s:y3, s:y1, s:y9]
  let [s:r1, s:r3, s:r4] = [s:r3, s:r1, s:r9]
endif

let s:fg     = s:term.'fg='
let s:bg     = s:term.'bg='
let s:sp     = s:term ==# 'gui' ? 'guisp=' : 'ctermul='
let s:style  = s:term.'='
let s:none   = s:style.'NONE'
let s:bold   = s:style.'bold'
let s:italic = s:style.'italic'
let s:underline = s:style.'underline'
let s:undercurl = s:style.'undercurl'

" --------
" - Base -
" --------
exe 'hi Normal'        s:fg s:n3 s:bg s:n0
exe 'hi Cursor'        s:fg s:n4 s:bg s:b4
exe 'hi CursorIM'      s:fg s:n4 s:bg s:y4
exe 'hi CursorLine'    s:bg s:n1 s:none
exe 'hi LineNr'        s:fg s:n2 s:bg s:n1
exe 'hi CursorLineNR'  s:fg s:n4 s:bg s:n2 s:none

" -----------------
" - Number column -
" -----------------
exe 'hi CursorColumn'  s:bg s:n1
exe 'hi FoldColumn'    s:bg s:n1
exe 'hi SignColumn'    s:fg s:g4 s:bg s:n1
exe 'hi Folded'        s:fg s:n2 s:bg s:n0

" -------------------------
" - Window/Tab delimiters -
" -------------------------
exe 'hi VertSplit'     s:bg s:n1
exe 'hi ColorColumn'   s:fg s:n2 s:bg s:n1
exe 'hi TabLine'       s:fg s:n3 s:bg s:n2 s:none
exe 'hi TabLineFill'   s:fg s:n3 s:bg s:n1 s:none
exe 'hi TabLineSel'    s:fg s:b3 s:bg s:n0 s:bold

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
exe 'hi Directory'     s:fg s:g4
exe 'hi Search'        s:fg s:n0 s:bg s:g4 s:bold
hi! link IncSearch Cursor

" -----------------
" - Prompt/Status -
" -----------------
exe 'hi StatusLine'    s:fg s:n2 s:bg s:n1
exe 'hi StatusLineNC'  s:fg s:n3 s:bg s:n2
exe 'hi Question'      s:fg s:y4 s:bg s:n0 s:none
exe 'hi Title'         s:fg s:b3 s:bg s:n0 s:bold
exe 'hi ModeMsg'       s:fg s:n3 s:bg s:n0 s:none
exe 'hi MoreMsg'       s:fg s:n2 s:bg s:n0 s:none
hi! link WildMenu Visual

" --------------
" - Visual aid -
" --------------
exe 'hi MatchParen'    s:fg s:b4 s:bg s:n1
exe 'hi Visual'        s:fg s:n4 s:bg s:b2 s:none
exe 'hi VisualNOS'     s:fg s:n3 s:bg s:n1 s:none
exe 'hi NonText'       s:fg s:n1 s:none

exe 'hi Todo'          s:fg s:b4 s:bg 'NONE' s:bold
exe 'hi Underlined'    s:fg s:b4
exe 'hi Error'         s:fg s:r4 s:bg 'NONE' s:bold
exe 'hi ErrorMsg'      s:fg s:r3 s:bg 'NONE' s:none
exe 'hi WarningMsg'    s:fg s:y3
hi! link Ignore NonText
hi! link SpecialKey NonText

" ------------------
" - Variable types -
" ------------------
exe 'hi Function'      s:fg s:b2
exe 'hi Identifier '   s:fg s:n3
exe 'hi Constant'      s:fg s:b2
exe 'hi String'        s:fg s:b3 s:bg s:n1
exe 'hi Character'     s:fg s:b2
exe 'hi Number'        s:fg s:b2
hi! link Boolean Number
hi! link Float Number

" -----------------------
" - Language constructs -
" -----------------------
exe 'hi Statement'     s:fg s:b3
exe 'hi Conditional'   s:fg s:b3
exe 'hi Repeat'        s:fg s:b3
exe 'hi Label'         s:fg s:b3 s:bold
exe 'hi Keyword'       s:fg s:b2
exe 'hi Exception'     s:fg s:y3
exe 'hi Comment'       s:fg s:g2
exe 'hi SpecialComment' s:fg s:g2 s:italic
exe 'hi SpecialChar'   s:fg s:b3
exe 'hi Tag'           s:fg s:g3
exe 'hi Type'          s:fg s:g4
exe 'hi Delimiter'     s:fg s:y4
exe 'hi Debug'         s:fg s:n2
hi! link Operator Normal
hi! link Special Statement

" ----------
" - C like -
" ----------
exe 'hi PreProc' s:fg s:b3


" --------
" - Diff -
" --------
exe 'hi DiffAdd'       s:fg s:b1 s:bg s:b3
exe 'hi DiffChange'    s:fg s:y1 s:bg s:y3
exe 'hi DiffDelete'    s:fg s:r2 s:bg s:r3
exe 'hi DiffText'      s:fg s:g1 s:bg s:g3 s:none

" -------------------
" - Completion menu -
" -------------------
exe 'hi Pmenu'         s:fg s:n1 s:bg s:b3
hi! link PmenuSel Cursor
exe 'hi PmenuSbar'     s:bg s:b1
exe 'hi PmenuThumb'    s:bg s:b3

" ------------
" - Spelling -
" ------------
exe 'hi SpellBad'      s:fg s:r3 s:bg s:r1 s:sp s:r4 s:undercurl
exe 'hi SpellCap'      s:fg s:y3 s:bg s:n0 s:sp s:y4 s:undercurl
exe 'hi SpellLocal'    s:fg s:g3 s:bg s:n0 s:sp s:g4 s:undercurl
exe 'hi SpellRare'     s:fg s:b3 s:bg s:n0 s:sp s:b4 s:undercurl

" ---------------------
" - Terminal -
" ---------------------
let g:terminal_ansi_colors = [
\ s:n0, s:r2, s:g2, s:y2, s:b2, s:m2, s:c2, s:n3,
\ s:n0, s:r4, s:g4, s:y4, s:b4, s:m4, s:c4, s:n4
\ ]

" ---------------------
" - Specific settings -
" ---------------------
exe 'hi JavaScriptEmbed' s:fg s:g4 s:bg s:n1

" Easy motion
exe 'hi EasyMotionShadeDefault' s:fg s:n2 s:bg s:n0
exe 'hi EasyMotionTarget' s:fg s:b4 s:bg s:n0
exe 'hi EasyMotionTarget2First' s:fg s:g4 s:bg s:n0
hi! link EasyMotionTarget2Second EasyMotionTarget2First

" ALE
exe 'hi ALEErrorSign' s:fg s:r4 s:bg s:n1
exe 'hi ALEWarningSign' s:fg s:y4 s:bg s:n1

" rainbow
let g:rainbow_conf = get(g:, 'rainbow_conf', {})
let g:rainbow_conf[s:term.'fgs'] = [s:b4, s:g4, s:y4, s:r4]

" rainbow-csv
if s:term ==# 'gui'
  let g:rcsv_colorpairs = [['7', s:b4], ['7', s:g4], ['7', s:y4], ['7', s:r4]]
else
  let g:rcsv_colorpairs = [[s:b4, 'Gray'], [s:g4, 'Gray'], [s:y4, 'Gray'], [s:r4, 'Gray']]
endif

function s:CustomSyntax()
  if g:colors_name != s:colors_name
    exe 'augroup CustomSyntax_' . s:colors_name . '|au!|augroup END'
    return
  endif
  " GitGutter
  exe 'hi GitGutterAdd' s:fg s:g3 s:bg s:n1
  exe 'hi GitGutterChange' s:fg s:y3 s:bg s:n1
  exe 'hi GitGutterDelete' s:fg s:r3 s:bg s:n1
  hi! link diffAdded DiffAdd
  hi! link diffChanged DiffChange
  hi! link diffRemoved DiffDelete
endfunction

exe 'augroup CustomSyntax_' . s:colors_name . '|au!|au ColorScheme,Syntax * call <SID>CustomSyntax()|augroup END'
call s:CustomSyntax()
