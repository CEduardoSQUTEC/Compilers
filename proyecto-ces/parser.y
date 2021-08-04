%{
#include <iostream>
#include <map>
#include <vector>

#include "types.h"

int yyerror(char *s);
int yyerror(std::string s);
extern "C" int yylex();

std::vector<std::map<std::string, var_t> > table;
typedef std::map<std::string, var_t>::iterator table_it;

var_t *declare(std::string id, type_t type);
var_t *get(std::string id);
bool find(std::string id);
bool find(std::string id, table_it &);
void update(std::string, var_t *new_val);

%}

%start programa 

%union {
  int          num_val;
  std::string* id_val;
  op_t         op_val;
  type_t       type_val;
  var_t        var_val;
  var_t*       var_ref;
}

%token <type_val> ENTERO
%token <type_val> BOOL
%token <type_val> SIN_TIPO
%token SI
%token SINO
%token MIENTRAS
%token RETORNO
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

%type <var_val> expresion
%type <var_val> expresion_simple
%type <var_val> expresion_aditiva
%type <var_val> term
%type <var_val> factor
%type <var_val> call
%type <var_ref> var
%type <var_val> args
%type <var_val> lista_arg
%type <op_val> mulop addop relop
%type <type_val> tipo

%%

programa: 
  lista_declaracion {
    if (table[0].find("main") == table[0].end()) {
      yyerror("No main function defined.");
    }
  }
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
  tipo ID EOS {
    declare(*$2, $1);
  } |
  tipo ID L_BRA NUM R_BRA EOS
  ;

tipo:
  SIN_TIPO {$$ = SIN_TIPO_T;} |
  ENTERO {$$ = ENTERO_T;} |
  BOOL {$$ = BOOL_T;}
  ;

fun_declaracion:
  tipo ID L_PAR params R_PAR sent_compuesta {
    declare(*$2, $1);
  }
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
  var OP_ASSIGN expresion {
    $1->type = $3.type;
    $1->val = $3.val;

    $$ = $3;
  } |
  expresion_simple {
    $$ = $1;
    // std::cout << "Type: " << $$.type << " val: " << $$.val << std::endl;
  } ;

var:
  ID {
    $$ = get(*$1);

    // std::cout << "VAR " << $$->val << std::endl;
  } |
  ID L_BRA expresion R_BRA ;

expresion_simple:
  expresion_aditiva relop expresion_aditiva {
    $$.type = BOOL_T;

    if ($2 == LT_T) {
      $$.val = $1.val < $3.val;
    } else if ($2 == LE_T) {
      $$.val = $1.val <= $3.val;
    } else if ($2 == GT_T) {
      $$.val = $1.val > $3.val;
    } else if ($2 == GE_T) {
      $$.val = $1.val >= $3.val;
    } else if ($2 == EQ_T) {
      $$.val = $1.val == $3.val;
    } else if ($2 == NEQ_T) {
      $$.val = $1.val != $3.val;
    }
  } |
  expresion_aditiva {
    $$ = $1;
  } ;

relop:
  OP_LT {$$ = LT_T} |
  OP_LE {$$ = LE_T} |
  OP_GT {$$ = GT_T} |
  OP_GE {$$ = GE_T} |
  OP_EQ {$$ = EQ_T} |
  OP_NEQ {$$ = NEQ_T} ;

expresion_aditiva:
  expresion_aditiva addop term {
    $$.type = ENTERO_T;

    if ($2 == PLUS_T) {
      $$.val = $1.val + $3.val;
    } else if ($2 == MINUS_T) {
      $$.val = $1.val - $3.val;
    }
  } |
  term {
    $$.type = $1.type;
    $$.val = $1.val;
  } ;

addop:
  OP_PLUS {$$ = PLUS_T;} |
  OP_MINUS {$$ = MINUS_T;} ;

term:
  term mulop factor {
    $$.type = ENTERO_T;

    if ($2 == MUL_T) {
      $$.val = $1.val * $3.val;
    } else if ($2 == DIV_T) {
      $$.val = $1.val / $3.val;
    } else if ($2 == MOD_T) {
      $$.val = $1.val % $3.val;
    }
  } |
  factor {
    $$.type = $1.type;
    $$.val = $1.val;
  } ;

mulop:
  OP_MUL {$$ = MUL_T;} |
  OP_DIV {$$ = DIV_T;} |
  OP_MOD {$$ = MOD_T;} ; // Agregado a la gramatica

factor:
  L_PAR expresion R_PAR {
    $$.type = $2.type;
    $$.val = $2.val;
  } |
  var {
    $$.type = $1->type;
    $$.val = $1->val;
  } |
  call {
    $$.type = $1.type;
    $$.val = $1.val;
  } |
  NUM {
    $$.type = ENTERO_T;
    $$.val = $1;
  } ;

call:
  ID L_PAR args R_PAR {
    if (*$1 == "salida") {
      if ($3.type == ENTERO_T) {
        std::cout << $3.val << std::endl;
      }
      else if ($3.type == BOOL_T) {
        std::cout << ($3.val == 0 ? "false" : "true") << std::endl;
      }
      $$.type = SIN_TIPO_T;
      $$.val = 0;
    }
    else if (*$1 == "entrada") {
      $$.type = ENTERO_T;
      std::cin >> $$.val;
    }
    else {
      var_t *var = get(*$1);

      $$.type = var->type;
      $$.val = var->val;
    }
  } ;

args:
  lista_arg {
    $$ = $1;
  } |
  ;

lista_arg:
  lista_arg COMMA expresion |
  expresion {
    $$ = $1;
  } ;

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

var_t *declare(std::string id, type_t type) {
  if (table.size() == 0) {
    table.resize(1);
  }

  if (table.back().find(id) != table.back().end()) {
    yyerror("Symbol '" + id + "' already exists.");
  }

  var_t v;
  table.back()[id] = v;

  var_t *var = &table.back()[id];

  var->type = type;
  var->val = 0;

  return var;
}

var_t *get(std::string id) {
  table_it it;

  if (!find(id, it)) {
    yyerror("Undefined character '" + id + "'");
  }

  // std::cout << "IN GET: " << it->second.val << std::endl;

  return &it->second;
}

bool find(std::string id) {
  table_it it;
  return find(id, it);
}

bool find(std::string id, table_it &it) {
  for (int i = table.size() - 1; i >= 0; i--) {
    it = table[i].find(id);

    if (it != table[i].end()) {
      return true;
    }
  }

  return false;
}

void update(std::string id , var_t *new_val) {
  table_it it;

  if (!find(id, it)) {
    yyerror("Unsefiden symbol '" + id + "'");
  }
  if (it->second.type != new_val->type) {
    yyerror("No valid type conversion for variable '" + id + "'");
  }

  it->second.type = new_val->type;
  it->second.val = new_val->val;
}
