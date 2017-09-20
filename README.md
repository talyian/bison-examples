# Bison Examples

Because I can never remember which combination of options and lex-params to use. Also, I wanted to provide some barebones examples of flex/bison without getting into cases using extra driver classes. 

There are a few variations here:

1. A simple C-based flex/bison parser
2. like #1, but using %option reentrant
3. A simple C++-based bison parser. Still uses C api for the flex scanner since flex++ seems less supported.
4. C++-based bison parser using `%define api.value.type variant` instead of `%union`

**Disclaimer**: This setup was the result of some amount of trial-and-error. Some of the #include-placement was done basically to get the thing to compile and link properly and not because of very well-throught-out reasons. The standard pattern for the yylex declaration is by defining the YY_DECL macro in a shared header.