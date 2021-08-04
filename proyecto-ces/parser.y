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

enum op_type {
  PLUS,
  MINUS,
  MUL,
  DIV,
  MOD,
  LT,
  LE,
  GT,
  GE,
  EQ,
  NEQ,
  ASSIGN
};


std::vector<std::map<std::string, type_val> > table;

void insert(std::string id, type_val val);
bool find(std::string id);
void update(std::string, type_val new_val);

%}

%start programa 

%union{
  int          datatype_val;
  std::string* id_val;
  int          num_val;
  op_type      op_val;
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
%token <op_val> OP_PLUS
%token <op_val> OP_MINUS
%token <op_val> OP_MUL
%token <op_val> OP_DIV
%token <op_val> OP_MOD
%token <op_val> OP_LT
%token <op_val> OP_LE
%token <op_val> OP_GT
%token <op_val> OP_GE
%token <op_val> OP_EQ
%token <op_val> OP_NEQ
%token <op_val> OP_ASSIGN
%token EOS
%token COMMA
%token L_PAR
%token R_PAR
%token L_BRA
%token R_BRA
%token L_CUR
%token R_CUR

%token <id_val> ID
%token <num_val> NUM

%type <num_val> expresion_aditiva term factor
%type <op_val> mulop addop

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
  expresion_aditiva addop term {
    if ($2 == PLUS) {
      $$ = $1 + $3;
    } else if ($2 == MINUS) {
      $$ = $1 - $3;
    }
    std::cout << $$ << std::endl;
  } |
  term {
    $$ = $1
  } ;

addop:
  OP_PLUS {$$ = PLUS;} |
  OP_MINUS {$$ = MINUS;} ;

term:
  term mulop factor {
    if ($2 == MUL) {
      $$ = $1 * $3;
    } else if ($2 == DIV) {
      $$ = $1 / $3;
    } else if ($2 == MOD) {
      $$ = $1 % $3;
    }
  } |
  factor {
    $$ = $1
  } ;

mulop:
  OP_MUL {$$ = MUL;} |
  OP_DIV {$$ = DIV;} |
  OP_MOD {$$ = MOD;} ; // Agregado a la gramatica

factor:
  L_PAR expresion R_PAR |
  var |
  call |
  NUM {
    $$ = $1;
  } ;

call:
  ID L_PAR args R_PAR {
    std::cout << *$1 << std::endl;
  } ;

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
