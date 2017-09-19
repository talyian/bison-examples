%option noyywrap
%{
#include "parser.tab.hh"
#define YYSTYPE yy::parser::semantic_type
%}

%option bison-bridge

%%

[0-9]+     { yylval->build(atoi(yytext)); return yy::parser::token::NUMBER; }
[+*/-]     { yylval->build(*yytext); return yy::parser::token::OP; }
[ \t]      { }
.          { return *yytext; }

%%

int main() {
  yy::parser P;
  P.parse();
}

