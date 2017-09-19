%skeleton "lalr1.cc"
%define api.value.type variant

%{
#include <iostream>
#include <string>
#include <cstdio>

// No, it doesn't make sense to me why I'm doing this
#include "parser.tab.hh"
int yylex(yy::parser::semantic_type * a);
%}

%token OP
%token NUMBER

%type <int32_t> NUMBER expr
%type <char> OP

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
