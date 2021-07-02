%{
#include <stdio.h>

int n_lines = 1;
%}

%%
entero  				{printf("TOKEN <ENTERO>");}
sin_tipo				{printf("TOKEN <SIN_TIPO>");}
si      				{printf("TOKEN <SI>");}
sino    				{printf("TOKEN <SINO>");}
mientras				{printf("TOKEN <MIENTRAS>");}
retorno 				{printf("TOKEN <RETORNO>");}
main    				{printf("TOKEN <MAIN>");}
entrada 				{printf("TOKEN <ENTRADA>");}
salida  				{printf("TOKEN <SALIDA>");}
[+]       				{printf("TOKEN <OP_PLUS>");}
[-]       				{printf("TOKEN <OP_MINUS>");}
[*]       				{printf("TOKEN <OP_MUL>");}
[/]       				{printf("TOKEN <OP_DIV>");}
[%]       				{printf("TOKEN <OP_MOD>");}
[<]       				{printf("TOKEN <OP_LT>");}
[<][=]     				{printf("TOKEN <OP_LE>");}
[>]       				{printf("TOKEN <OP_GT>");}
[>][=]     				{printf("TOKEN <OP_GE>");}
[=][=]     				{printf("TOKEN <OP_EQ>");}
[!][=]     				{printf("TOKEN <OP_NEQ>");}
[=]       				{printf("TOKEN <OP_ASSIGN>");}
[;]       				{printf("TOKEN <SEMICOLON>");}
[,]       				{printf("TOKEN <COMMA>");}
[(]       				{printf("TOKEN <L_PAR>");}
[)]       				{printf("TOKEN <R_PAR>");}
[[]       				{printf("TOKEN <L_BRA>");}
[]]       				{printf("TOKEN <R_BRA>");}
[{]       				{printf("TOKEN <L_CUR>");}
[}]       				{printf("TOKEN <R_CUR>");}
[a-zA-z][a-zA-z0-9]*	{printf("TOKEN <ID>");}
[1-9][0-9]*				{printf("TOKEN <NUM>");}
%%

int yywrap() {}
int main(int argc, char **argv) {
	yylex();
}

