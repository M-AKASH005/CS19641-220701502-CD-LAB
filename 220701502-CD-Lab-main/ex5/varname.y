%{
#include <stdio.h>
#include <stdlib.h>
%}

%token VALID_VAR INVALID

%%
input:
    VALID_VAR { printf("✅ Valid variable name.\n"); }
  | INVALID   { printf("❌ Invalid variable name.\n"); }
  ;
%%

int main() {
    printf("Enter a variable name: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Syntax error: %s\n", s);
}
