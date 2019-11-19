" Vim syntax file
" Language:         lark-parser grammar
" Maintainer:       Sam Steffl
" Last Change:      Nov 15, 2019

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"============================================================================
" terminal expression
"============================================================================
syn region larkTermProduction start=/^[_A-Z]\+/ skip=/\n\s\+\S/ end=/$/
   \ keepend contains=larkTermLHS,larkTermRHS

"-----------------------------------------------------------------------------
syn region larkTermLHS start=/^/ end=/\>/ contained 
    \ contains=larkTermLHSnormal,larkTermLHSignore

syn match larkTermLHSnormal /^[A-Z][_A-Z]\+/ contained
syn match larkTermLHSignore /^_[_A-Z]\+/ contained

"-----------------------------------------------------------------------------
syn region larkTermRHS matchgroup=larkTermColon start=/:/ skip=/\n\s\+\S/ end=/$/ contained
    \ contains=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \          larkTermTermIgnore,larkTermRepeat,larkTermString,
    \          larkTermRegex,larkTermQuant

"-----------------------------------------------------------------------------
syn region larkTermGroup matchgroup=larkGroupSymbol start=/(/ end=/)/ contained
    \ contains=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \          larkTermTermIgnore,larkTermRepeat,larkTermString,
    \          larkTermRegex,larkTermQuant
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn region larkTermMaybe matchgroup=larkMaybeSymbol start=/\[/ end=/\]/ contained
    \ contains=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \          larkTermTermIgnore,larkTermRepeat,larkTermString,
    \          larkTermRegex,larkTermQuant
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermOr /|/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,          larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermTermNormal /[A-Z][_A-Z]\+/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermTermIgnore /_[_A-Z]\+/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermRepeat /"[a-zA-Z0-9]"\.\."[a-zA-Z0-9]"/ contained
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermString /\s"[^"]*"\(\s\|$\)/ contained
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermRegex /\v\/([^\/]|(\\\/)|\\)+\/[imulx]*/ contained
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex,larkTermQuant

syn match larkTermQuant /\v(\?|\*|\+|\s*\~\s*\d+(\.\.\d+)?)/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermOr,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermRepeat,larkTermString,
    \           larkTermRegex

"============================================================================
" rule expression
"============================================================================
syn region larkRuleProduction start=/^[?!_]\?[_a-z]\+/ skip=/\n\s\+\S/ end=/$/
    \ keepend contains=larkRuleLHS,larkRuleRHS

"-----------------------------------------------------------------------------
syn region larkRuleLHS start=/^/ end=/\>/ contained 
    \ contains=larkRuleLHSnormal,larkRuleLHSflatten,larkRuleLHSnoignore

syn match larkRuleLHSnormal /^[a-z][_a-z]\+/ contained
syn match larkRuleLHSflatten /^[_\?][_a-z]\+/ contained
syn match larkRuleLHSnoignore /^\![_a-z]\+/ contained

"-----------------------------------------------------------------------------
syn region larkRuleRHS matchgroup=larkRuleColon start=/:/ skip=/\n\s\+\S/ end=/$/ contained
    \ contains=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \          larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \          larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \          larkRuleQuant,larkRuleAlias

"-----------------------------------------------------------------------------
syn region larkRuleGroup matchgroup=larkGroupSymbol start=/(/ end=/)/ contained
    \ contains=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \          larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \          larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \          larkRuleQuant
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn region larkRuleMaybe matchgroup=larkMaybeSymbol start=/\[/ end=/\]/ contained
    \ contains=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \          larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \          larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \          larkRuleQuant
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleOr /|/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \                      larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleTermNormal /[A-Z][_A-Z]\+/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleTermIgnore /_[_A-Z]\+/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleRuleNormal /[a-z][_a-z]\+/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleRuleFlatten /[_\?][_a-z]\+/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleRuleNoignore /\![_a-z]\+/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleRepeat /"[a-zA-Z0-9]"\.\."[a-zA-Z0-9]"/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleString /\s"[^"]*"\(\s\|$\)/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleRegex /\v\/([^\/]|(\\\/)|\\)+\/[imulx]*/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \           larkRuleQuant,larkRuleAlias

syn match larkRuleQuant /\v(\?|\*|\+|\s*\~\s*\d+(\.\.\d+)?)/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleOr,larkRuleRepeat,larkRuleString,larkRuleRegex,
    \                         larkRuleAlias

"-----------------------------------------------------------------------------
syn match larkRuleAlias /->/ contained nextgroup=larkRuleAliasTarget
syn match larkRuleAliasTarget /[a-z][_a-z]*/ contained 

"============================================================================
" directives
"============================================================================
syn match larkDirective /^%.*/

"============================================================================
" comments
"============================================================================
syn match larkComment /^\/\/.*$/

"============================================================================
" highlighting
"============================================================================
hi      larkGroupSymbol      ctermfg=brown cterm=bold
hi link larkMaybeSymbol      larkGroupSymbol

hi      larkTermLHSnormal    ctermfg=red cterm=bold 
hi      larkTermLHSignore    ctermfg=red
hi link larkTermColon        larkGroupSymbol
hi link larkTermOr           larkTermColon
hi link larkTermTermNormal   larkTermLHSnormal
hi link larkTermTermIgnore   larkTermLHSignore
hi      larkTermRepeat       ctermfg=gray
hi      larkTermString       ctermfg=darkgreen
hi link larkTermRegex        larkTermString
hi link larkTermQuant        larkTermRepeat

hi      larkRuleLHSnormal    ctermfg=darkblue cterm=bold 
hi      larkRuleLHSflatten   ctermfg=darkblue
hi      larkRuleLHSnoignore  ctermfg=darkblue
hi link larkRuleColon        larkTermColon
hi link larkRuleOr           larkRuleColon
hi link larkRuleTermNormal   larkTermLHSnormal
hi link larkRuleTermIgnore   larkTermLHSignore
hi link larkRuleRuleNormal   larkRuleLHSnormal
hi link larkRuleRuleFlatten  larkRuleLHSflatten
hi link larkRuleRuleNoignore larkRuleLHSnoignore
hi link larkRuleRepeat       larkTermRepeat
hi link larkRuleString       larkTermString
hi link larkRuleRegex        larkTermRegex
hi link larkRuleQuant        larkTermQuant
hi link larkRuleAlias        larkRuleColon
hi link larkRuleAliasTarget  larkRuleLHSnormal

hi      larkDirective        ctermfg=cyan cterm=bold
hi link larkComment          Comment

"-----------------------------------------------------------------------------
" debugging
"-----------------------------------------------------------------------------
" https://vi.stackexchange.com/a/11877
nnoremap zS :echo join(reverse(map(synstack(line('.'), col('.')), 
  \ 'synIDattr(v:val,"name")')),' ')<cr>

