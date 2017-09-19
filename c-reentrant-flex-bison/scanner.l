%option noyywrap

/* this adds a yyscan_t parameter to yylex() */
%option reentrant

/* this adds a YYSCAN parameter to yylex() */
%option bison-bridge

%{
#include "parser.tab.h"
%}

%%

[0-9]+     { yylval->number = atoi(yytext); return NUMBER; }
[+*/-]     { yylval->op = *yytext; return OP; }
[ \t]      { }
.          { return *yytext; }

%%

int main() {
 yyscan_t S;
 yylex_init(&S);
 return yyparse(S);
}

