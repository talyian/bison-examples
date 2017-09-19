run: scanner.ll parser.yy
	flex scanner.l
	bison -d parser.yy
	g++ -c parser.tab.cc
	g++ -c lex.yy.c
	g++ parser.tab.o lex.yy.o 
	echo "1 + 2 * 3 - 4" | ./a.out
