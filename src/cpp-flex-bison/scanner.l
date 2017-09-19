%option noyywrap
%{
#include "parser.tab.h"
%}

%%

[0-9]+     { atoi(yytext); return yy::parser::token::NUMBER; }
[+*/-]     { *yytext; return yy::parser::token::OP; }
[ \t]      { }
.          { return *yytext; }

%%

int main() {
  yyFlexLexer F();
  F.yylex();
  yy::parser P;
  P.parse();
}

