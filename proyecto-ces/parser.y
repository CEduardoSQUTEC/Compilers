%{
#include <iostream>
#include <map>
#include <vector>

int yyerror(char *s);
int yyerror(std::string s);
extern "C" int yylex();

struct type_val{
  int type;
  int val;
};


std::vector<std::map<std::string, type_val> > table;

void insert(std::string id, type_val val);
bool find(std::string id);
void update(std::string, type_val new_val);

%}

%start programa 

%union{
  int          type_val;
  std::string* id_val;
  int          num_val;
}

%token ENTERO
%token BOOL
%token SIN_TIPO
%token SI
%token SINO
%token MIENTRAS
%token RETORNO
%token MAIN
%token ENTRADA
%token SALIDA
%token OP_PLUS
%token OP_MINUS
%token OP_MUL
%token OP_DIV
%token OP_MOD
%token OP_LT
%token OP_LE
%token OP_GT
%token OP_GE
%token OP_EQ
%token OP_NEQ
%token OP_ASSIGN
%token EOS
%token COMMA
%token L_PAR
%token R_PAR
%token L_BRA
%token R_BRA
%token L_CUR
%token R_CUR

%token <id_val>   ID
%token <num_val>  NUM
%%

programa: 
  lista_declaracion
  ;

lista_declaracion:
  lista_declaracion declaracion |
  declaracion  
  ;

declaracion:
  var_declaracion |
  fun_declaracion
  ;

var_declaracion:
  tipo ID EOS |
  tipo ID L_BRA NUM R_BRA EOS
  ;

tipo:
  SIN_TIPO |
  ENTERO |
  BOOL
  ;

fun_declaracion:
  tipo ID L_PAR params R_PAR sent_compuesta
  ;

params:
  list_params |
  ;

list_params:
  list_params COMMA param |
  param
  ;

param:
  tipo ID |
  tipo ID L_BRA R_BRA
  ;

sent_compuesta:
  L_CUR declaracion_local lista_sentencias R_CUR
  ;

declaracion_local:
  declaracion_local var_declaracion |
  ;

lista_sentencias:
  lista_sentencias sentencia |
  ;

sentencia:
  sentencia_expresion |
  sentencia_seleccion |
  sentencia_iteracion |
  sentencia_retorno ;

sentencia_expresion:
  expresion EOS |
  EOS ;

sentencia_seleccion:
  SI L_PAR expresion R_PAR sentencia |
  SI L_PAR expresion R_PAR sentencia SINO sentencia ;

sentencia_iteracion:
  MIENTRAS L_PAR expresion R_PAR L_CUR lista_sentencias R_CUR ;

sentencia_retorno:
  RETORNO EOS |
  RETORNO expresion EOS ;

expresion:
  var OP_ASSIGN expresion |
  expresion_simple ;

var:
  ID |
  ID L_BRA expresion R_BRA ;

expresion_simple:
  expresion_aditiva relop expresion_aditiva |
  expresion_aditiva ;

relop:
  OP_LT |
  OP_LE |
  OP_GT |
  OP_GE |
  OP_EQ |
  OP_NEQ ;

expresion_aditiva:
  expresion_aditiva addop term |
  term ;

addop:
  OP_PLUS |
  OP_MINUS ;

term:
  term mulop factor |
  factor;

mulop:
  OP_MUL |
  OP_DIV |
  OP_MOD; // Agregado a la gramatica

factor:
  L_PAR expresion R_PAR |
  var |
  call |
  NUM ;

call:
  ID L_PAR args R_PAR ;

args:
  lista_arg |
  ;

lista_arg:
  lista_arg COMMA expresion |
  expresion ;

%%

int yyerror(char *s) {
  return yyerror(std::string(s));
}

int yyerror(std::string s) {
  extern int yylineno;	// defined and maintained in lex.c
  extern char *yytext;	// defined and maintained in lex.c

  std::cerr << "error: " << s << " at symbol \"" << yytext;
  std::cerr << "\" on line " << yylineno << std::endl;
  exit(1);
}

void insert(std::string id, type_val val){
  table.back()[id] = val;
}

bool find(std::string id){
  return table.back().find(id) != table.back().end();
}

void update(std::string id , type_val new_val) {
  if (find(id)) {
    table.back()[id] = new_val;
  }
}
