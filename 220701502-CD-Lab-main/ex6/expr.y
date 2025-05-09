%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

S: E '\n'   { printf("Result = %d\n", $1); return 0; }
 ;

E: E '+' E   { $$ = $1 + $3; }
 | E '-' E   { $$ = $1 - $3; }
 | E '*' E   { $$ = $1 * $3; }
 | E '/' E   {
     if ($3 == 0) {
         yyerror("Division by zero!");
         exit(1);
     }
     $$ = $1 / $3;
   }
 | E '%' E   { $$ = $1 % $3; }
 | '(' E ')' { $$ = $2; }
 | NUMBER    { $$ = $1; }
 ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}
