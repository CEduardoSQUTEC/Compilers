#include <vector>

enum type_t {
  ENTERO_T,
  BOOL_T,
  SIN_TIPO_T
};

// struct function_t {
//   type_t return_type;
//   std::vector<type_t> args_type;
// };

// operation type
enum op_t {
  PLUS_T,
  MINUS_T,
  MUL_T,
  DIV_T,
  MOD_T,
  LT_T,
  LE_T,
  GT_T,
  GE_T,
  EQ_T,
  NEQ_T,
  ASSIGN_T
};

typedef struct var_t {
  type_t type;
  int val;
} var_t;