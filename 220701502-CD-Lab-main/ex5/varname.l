%{
#include "varname.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9_]*   { return VALID_VAR; }
.                       { return INVALID; }
\n                      { return 0; }
%%

int yywrap() {
    return 1;
}
