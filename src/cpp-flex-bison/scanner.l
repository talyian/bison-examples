%option noyywrap
%{
#include "parser.tab.h"
%}

%%

[0-9]+     { yylval = atoi(yytext); return NUMBER; }
[+*/-]     { yylval = *yytext; return OP; }
[ \t]      { }
.          { return *yytext; }

%%

int main() {
  return yyparse();
}

