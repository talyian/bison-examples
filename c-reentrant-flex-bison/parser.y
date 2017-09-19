%{
#include <stdio.h>
int  yylex();
void yyerror(void * scanner, const char * msg) { printf("error %s", msg); }  
%}

/* the following three lines call yylex with a reentrant scanner object and a lval pointer */
%define api.pure full
%lex-param { yyscan_t scanner }
%parse-param { void * scanner }

%union {
  int number;
  char op;
}

%token OP
%token NUMBER

%type <number> NUMBER expr
%type <op> OP
%%

result : expr { printf("%d\n", $1); }

expr   : NUMBER { $$ = $1; }
       | expr OP NUMBER {
           switch ($2) {
	   case '+': $$ = $1 + $3; break;
	   case '-': $$ = $1 - $3; break;
	   case '*': $$ = $1 * $3; break;
	   case '/': $$ = $1 / $3; break;
	   }
         }
%%
