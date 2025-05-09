%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

int paren_count = 0;
%}

DIGIT   [0-9]
NUMBER  {DIGIT}+(\.{DIGIT}+)?
OP      [\+\-\*/]
WS      [ \t]+

%%

{NUMBER}        { printf("Number: %s\n", yytext); }
{OP}            { printf("Operator: %s\n", yytext); }
"("             { paren_count++; printf("Left Paren\n"); }
")"             { paren_count--; printf("Right Paren\n"); }
{WS}            { /* ignore whitespace */ }
\n              { return 0; }
.               { printf("Invalid token: %s\n", yytext); }

%%

int main() {
    printf("Enter expression:\n");
    yylex();
    if (paren_count != 0) {
        printf("Unbalanced parentheses!\n");
    } else {
        printf("Valid arithmetic expression.\n");
    }
    return 0;
}
