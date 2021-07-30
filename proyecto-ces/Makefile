CXX = g++
CFLAGS	= -g -Wall -ansi -pedantic
OBJS = bison.o lexer.o

all: main lexer

main: main.cpp $(OBJS)
	$(CXX) $< $(OBJS) -o $@ -lfl

lexer.o: lexer.l
	lex lexer.l
	$(CXX) $(CFLAGS) -c lex.yy.c -o $@
	rm lex.yy.c

bison.o: bison.c
	$(CXX) $(CFLAGS) -c bison.c -o bison.o

bison.c: calc.y
	bison -d -v calc.y
	cp calc.tab.c bison.c
	cmp -s calc.tab.h tok.h || cp calc.tab.h tok.h

clean:
	rm -f main lexer.o*.o *~ lex.c lex.yy.c bison.c tok.h calc.tab.c calc.tab.h calc.output calc
