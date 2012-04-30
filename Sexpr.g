grammar Sexpr;

tokens {
LPAREN='(';
RPAREN=')';
DOT;
}

@package {com.arcanearcade.antlr}
@lexer::package {com.arcanearcade.antlr}

sexpr
	: item* EOF
	;
item
	: atom
	| (list)=> list
	| LPAREN item DOT item RPAREN
	;
list
	: LPAREN item* RPAREN
	;
atom
	: STRING | SYMBOL | NUMBER | DOT
	;
	
STRING
	:'"' ( '\\' . | ~('\\'|'"') )* '"'
	;
WHITESPACE
	: (' ' | '\n' | '\t' | '\r')+ 
		{skip();}
	;
NUMBER
	: ('+' | '-')? (DIGIT)+ ('.' (DIGIT)+)?
	;
SYMBOL
	: SYMBOL_START (SYMBOL_START | DIGIT)*  {if ($text.equals('.'))  $type = DOT;}
	;

fragment
SYMBOL_START 
	: ('a'..'z') | ('A'..'Z') 
	| '+' | '-' | '*' | '/' 
	| '.'
	;
fragment
DIGIT
	: ('0'..'9')
	;
