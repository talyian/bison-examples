run: scanner.l parser.y
	flex scanner.l
	bison -d parser.y
	gcc parser.tab.c lex.yy.c
	echo "1 + 2 * 3 - 4" | ./a.out
