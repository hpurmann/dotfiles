""
"" tiger.vim for Tiger Vim Syntax File in /u/ext/flz/conf/.vim
""
"" Made by Florent Thoumie 
"" Login   <flz@epita.fr>
""
"" Started on  Mon Jan 13 11:24:50 2003 Florent Thoumie 
"" Last update Sun Jan 19 19:07:25 2003 florent thoumie
""

" Vim syntax file
" Language:	Tiger
" Maintener:	Florent Thoumie <flz@epita.fr>
" Version:	0.1

" This file is for scholastic purposes only.
" My knowledge of vim indent/syntax files is _really_ poor so these two
" files don't do anything else that what _i_ want them to do.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
  
syntax clear

" Tiger keywords
syn keyword	tigerTypes		int string
syn keyword	tigerDefinition		let in end
syn keyword	tigerDeclaration	array of type function var nil
syn keyword	tigerStatement		break
syn keyword	tigerConditional	if then else
syn keyword	tigerLoop		for to do while
syn keyword	tigerTodo		contained TODO FIXME XXX

syn keyword	tigerFunctions		print print_int flush getchar
syn keyword	tigerFunctions		ord chr size substring not exit

syn region	tigerComment		start="/\*" end="\*/" contains=tigerTodo
syn region	tigerString		start="\"" skip="\\\"" end="\""

"syn region	tigerParen		start="(" skip="\\$" end="$" end=")"
"syn match	tigerParenErr		contained ")"
"syn region	tigerBracket		start="{" skip="\\$" end="$" end="}"
"syn match	tigerBracketErr		contained "}"
"syn region	tigerCrochet		start="\[" skip="\\$" end="$" end="\]"
"syn match	tigerCrochetErr		contained "\]"

syn match	tigerNumbers		"\s\(\d\+\|\\\x\{2}\|\\\o\{3}\)" contains=tigerNumberErr
syn match	tigerNumberErr		contained "\\\o*[89]\d*"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tiger_syn_inits")
  if version < 508
    let did_tiger_syn_inits = 1
    command -nargs=+ HiLink HiLink <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
		  
  HiLink tigerTodo		Todo
  HiLink tigerComment		Comment
  HiLink tigerString		String
  HiLink tigerConditional	Conditional
  HiLink tigerLoop		Conditional
  HiLink tigerStatement		Statement
  HiLink tigerNumbers		Number
  HiLink tigerDefinition	Statement
  HiLink tigerDeclaration	Structure
  HiLink tigerTypes		Type

  " Here you can enable/disable Functions highlight
  HiLink tigerFunctions		Function

"  HiLink tigerNumberErr		Error
"  HiLink tigerParenErr		Error
"  HiLink tigerBracketErr	Error
"  HiLink tigerCrochetErr	Error
  
  delcommand HiLink
endif

let b:current_syntax = "tiger"
