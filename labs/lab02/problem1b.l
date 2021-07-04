%{
#include <stdio.h>

int n_lines = 1;
%}

%%
[=]									{printf("<ASSIGN> ");}
[<]									{printf("<RELOP LT> ");}
[<][=]								{printf("<RELOP LE> ");}
[>]									{printf("<RELOP GT> ");}
[>][=]								{printf("<RELOP GE> ");}
[=][=] 								{printf("<RELOP EQ> ");}
if									{printf("<IF> ");}
else								{printf("<ELSE> ");}
[' ']								{;}
[(]									{printf("<PARBEGIN> ");}
[)]									{printf("<PAREND> ");}
[&][&]								{printf("<AND> ");}
[|][|]								{printf("<OR> ");}
[a-zA-z][a-zA-z0-9]* 				{printf("<ID %s> ", yytext);}
[0-9]*(\.[0-9]*)?([Ee][+-]?[0-9]+)?	{printf("<NUM %s> ", yytext);}
[+]									{printf("<OP SUM> ");}
[-]									{printf("<OP MINUS> ");}
[*] 								{printf("<OP MUL> ");}
[/] 								{printf("<OP DIV> ");}
[%] 								{printf("<OP MOD> ");}
\n									{printf("\n"); n_lines++;}
.									{printf("Error en linea %d, caracter \'%s\' no soportado. ", n_lines, yytext);}
%%

int yywrap(){}
int main(int argc, char **argv) {
	yylex();
}

