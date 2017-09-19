%skeleton "lalr1.cc"

%{
#include <iostream>
#include <string>
#include <cstdio>
%}

%union {
  int number;
  char op;     
}

%token OP
%token NUMBER

%type <number> NUMBER expr
%type <op> OP

%{
// this declaration needs to be after the %union so semantic_type is defined
int yylex(yy::parser::semantic_type * a);
%}

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
