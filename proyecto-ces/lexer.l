%{
#include <stdio.h>
#include <iostream>

#include "types.h"

#include "tok.h"

extern "C" int yylex();
int yyerror(char *s);
%}

digit		[0-9]
letter		[a-zA-Z]

%%
entero  						{return ENTERO;}
bool  							{return BOOL;}
sin_tipo						{return SIN_TIPO;}
si      						{return SI;}
sino    						{return SINO;}
mientras						{return MIENTRAS;}
retorno 						{return RETORNO;}
[+]     						{return OP_PLUS;}
[-]       						{return OP_MINUS;}
[*]       						{return OP_MUL;}
[/]       						{return OP_DIV;}
[%]       						{return OP_MOD;}
[<]       						{return OP_LT;}
[<][=]     						{return OP_LE;}
[>]       						{return OP_GT;}
[>][=]     						{return OP_GE;}
[=][=]     						{return OP_EQ;}
[!][=]     						{return OP_NEQ;}
[=]       						{return OP_ASSIGN;}
[;]       						{return EOS;}
[,]       						{return COMMA;}
[(]       						{return L_PAR;}
[)]       						{return R_PAR;}
[[]       						{return L_BRA;}
[]]       						{return R_BRA;}
[{]       						{return L_CUR;}
[}]       						{return R_CUR;}
{letter}({letter}|{digit})*		{yylval.id_val = new std::string(yytext); return ID;}
{digit}+						{yylval.num_val = atoi(yytext); return NUM;}
\n								{yylineno++;}
[\t ]+							{}
.								{yyerror("lexical");}
%%

// main    						{return MAIN;}
// entrada 						{return ENTRADA;}
// salida  						{return SALIDA;}


/////////////////////////////////////////
