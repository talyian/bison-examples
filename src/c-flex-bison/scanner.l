%option noyywrap
%{
#include "parser.tab.h"
%}

%%

[0-9]+     { yylval.number = atoi(yytext); return NUMBER; }
[+*/-]     { yylval.op = *yytext; return OP; }
[ \t]      { }
.          { return *yytext; }

%%

int main() {
  return yyparse();
}

