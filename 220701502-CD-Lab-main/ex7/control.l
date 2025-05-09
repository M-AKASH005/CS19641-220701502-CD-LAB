%{
#include "control.tab.h"
%}

%%

"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"for"           { return FOR; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }

"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }
":"             { return COLON; }

"=="|"!="|"<="|">="|"<"|">"  { return REL_OP; }
"="|"++"|"--"                { return ASSIGN_OP; }
"+"|"-"|"*"|"/"              { return ARITH_OP; }

[0-9]+                      { return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*      { return ID; }

[ \t\r\n]+                  { /* skip whitespace */ }

.                           { return yytext[0]; }

%%

int yywrap() { return 1; }
