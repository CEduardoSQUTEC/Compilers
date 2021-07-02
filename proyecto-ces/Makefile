CXX = g++

all: main lexer

main: main.cpp
	$(CXX) $< -o $@

lexer: lexer.l
	lex lexer.l
	$(CXX) lex.yy.c -o $@
	rm lex.yy.c

clean:
	rm main lexer
