%{
#include <stdio.h>
int  yylex();
void yyerror(const char * msg) { printf("error %s", msg); }  
%}

%token OP
%token NUMBER

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
