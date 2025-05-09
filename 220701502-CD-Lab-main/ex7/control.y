%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token IF ELSE WHILE FOR SWITCH CASE DEFAULT
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COLON
%token REL_OP ASSIGN_OP ARITH_OP
%token ID NUMBER

%%

program:
      statement
    ;

statement:
      if_statement
    | while_statement
    | for_statement
    | switch_statement
    ;

if_statement:
      IF LPAREN expr RPAREN block
    | IF LPAREN expr RPAREN block ELSE block
    ;

while_statement:
      WHILE LPAREN expr RPAREN block
    ;

for_statement:
      FOR LPAREN expr SEMICOLON expr SEMICOLON expr RPAREN block
    ;

switch_statement:
      SWITCH LPAREN expr RPAREN LBRACE case_list RBRACE
    ;

case_list:
      case_list case
    | case
    ;

case:
      CASE NUMBER COLON block
    | DEFAULT COLON block
    ;

block:
      LBRACE expr_list RBRACE
    ;

expr_list:
      expr_list expr SEMICOLON
    | expr SEMICOLON
    ;

expr:
      ID ASSIGN_OP expr
    | ID REL_OP ID
    | ID ARITH_OP ID
    | ID
    | NUMBER
    ;

%%

void yyerror(const char *s) {
    printf("❌ Syntax Error: %s\n", s);
}
int main() {
    printf("Enter your control structure:\n");
    yyparse();
    return 0;
}

