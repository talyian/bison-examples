# Cpp Parser

The Cpp parser is enabled by `#skeleton "lalr1.cc"`. In addition, yylval is now a nested type inside of `yy::parser`, so a couple shenanigans were needed to get the function declarations correct.
