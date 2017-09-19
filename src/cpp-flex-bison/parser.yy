%skeleton "lalr1.cc"

%{
#include <iostream>
#include <string>
#include <cstdio>
int yylex(void * a);
%}

%token OP
%token NUMBER

%%

result : expr { std::cout << $1 << std::endl; }

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

void yy::parser::error(const std::string & msg) {
  std::cout << msg << std::endl;
}
