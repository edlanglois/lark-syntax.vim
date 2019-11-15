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
syn region larkTermProduction start=/^[_A-Z]\+/ end=/$/ 
    \ contains=larkTermLHS,larkTermRHS

"-----------------------------------------------------------------------------
syn region larkTermLHS start=/^/ end=/\>/ contained 
    \ contains=larkTermLHSnormal,larkTermLHSignore

syn match larkTermLHSnormal /^[A-Z][_A-Z]\+/ contained
syn match larkTermLHSignore /^_[_A-Z]\+/ contained

"-----------------------------------------------------------------------------
syn region larkTermRHS matchgroup=larkTermColon start=/:/ end=/$/ contained
    \ contains=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \          larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

"-----------------------------------------------------------------------------
syn region larkTermGroup matchgroup=larkGroupSymbol start=/(/ end=/)/ contained
    \ contains=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \          larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

syn region larkTermMaybe matchgroup=larkMaybeSymbol start=/\[/ end=/\]/ contained
    \ contains=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \          larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

syn match larkTermTermNormal /[A-Z][_A-Z]\+/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

syn match larkTermTermIgnore /_[_A-Z]\+/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

syn match larkTermString /"[^"]*"/ contained
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

syn match larkTermRegex /\v\/([^\/]|(\\\/)|\\)+\/[imulx]*/ contained
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant

syn match larkTermQuant /\v(\?|\*|\+|\s*\~\s*\d+(\.\.\d+)?)/ contained 
    \ nextgroup=larkTermGroup,larkTermMaybe,larkTermTermNormal,
    \           larkTermTermIgnore,larkTermString,larkTermRegex,larkTermQuant


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
syn region larkRuleRHS start=/:/ skip=/\n\s\+\S/ end=/$/ contained
    \ contains=larkRuleColonLine,larkRuleOrLine

syn region larkRuleColonLine matchgroup=larkRuleColon start=/:/ end=/$/ contained
    \ contains=larkRuleValue
syn region larkRuleOrLine matchgroup=larkRuleOr start=/\s\+|\s\+/ end=/$/ contained
    \ contains=larkRuleValue

syn region larkRuleValue start=/\S/ end=/$/ contained
    \ contains=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \          larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \          larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

"-----------------------------------------------------------------------------
syn region larkRuleGroup matchgroup=larkGroupSymbol start=/(/ end=/)/ contained
    \ contains=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \          larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \          larkRuleString,larkRuleRegex,larkRuleQuant
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn region larkRuleMaybe matchgroup=larkMaybeSymbol start=/\[/ end=/\]/ contained
    \ contains=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \          larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \          larkRuleString,larkRuleRegex,larkRuleQuant
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleTermNormal /[A-Z][_A-Z]\+/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleTermIgnore /_[_A-Z]\+/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleRuleNormal /^[a-z][_a-z]\+/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleRuleFlatten /^[_\?][_a-z]\+/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleRuleNoignore /^\![_a-z]\+/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleString /"[^"]*"/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleRegex /\v\/([^\/]|(\\\/)|\\)+\/[imulx]*/ contained
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleQuant,larkRuleAlias

syn match larkRuleQuant /\v(\?|\*|\+|\s*\~\s*\d+(\.\.\d+)?)/ contained 
    \ nextgroup=larkRuleGroup,larkRuleMaybe,larkRuleTermNormal,larkRuleTermIgnore,
    \           larkRuleRuleNormal,larkRuleRuleFlatten,larkRuleRuleNoignore,
    \           larkRuleString,larkRuleRegex,larkRuleAlias

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
syn match larkComment /^#.*$/

"============================================================================
" highlighting
"============================================================================
hi      larkGroupSymbol      ctermfg=brown
hi link larkMaybeSymbol      larkGroupSymbol

hi      larkTermLHSnormal    ctermfg=red cterm=bold 
hi      larkTermLHSignore    ctermfg=red
hi link larkTermColon        larkGroupSymbol
hi link larkTermTermNormal   larkTermLHSnormal
hi link larkTermTermIgnore   larkTermLHSignore
hi      larkTermString       ctermfg=green
hi link larkTermRegex        larkTermString
hi      larkTermQuant        ctermfg=gray

hi      larkRuleLHSnormal    ctermfg=darkblue cterm=bold 
hi      larkRuleLHSflatten   ctermfg=darkblue
hi      larkRuleLHSnoignore  ctermfg=darkblue
hi link larkRuleColon        larkTermColon
hi link larkRuleTermNormal   larkTermLHSnormal
hi link larkRuleTermIgnore   larkTermLHSignore
hi link larkRuleRuleNormal   larkRuleLHSnormal
hi link larkRuleRuleFlatten  larkRuleLHSflatten
hi link larkRuleRuleNoignore larkRuleLHSnoignore
hi link larkRuleString       larkTermString
hi link larkRuleRegex        larkTermRegex
hi link larkRuleQuant        larkTermQuant
hi link larkRuleAlias        larkTermQuant
hi link larkRuleAliasTarget  larkRuleLHSnormal

hi      larkDirective        ctermfg=cyan cterm=bold
hi link larkComment          Comment

"-----------------------------------------------------------------------------
" debugging
"-----------------------------------------------------------------------------
" https://vi.stackexchange.com/a/11877
nnoremap zS :echo join(reverse(map(synstack(line('.'), col('.')), 
  \ 'synIDattr(v:val,"name")')),' ')<cr>

