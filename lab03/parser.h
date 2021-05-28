//
// Created by César Salcedo on 5/19/21.
//

#ifndef TOKENIZER_PARSER_H
#define TOKENIZER_PARSER_H

#include "lexer.h"
#include "node.h"

class parser {
    lexer lexer_{};
    token current_token_{};
    node<token> *root_{};

public:
    parser(lexer lexer);

    void parse();

    node<token> *exp();

    node<token> *op_sum();

    node<token> *factor();

    node<token> *op_mul();

    node<token> *S();

    node<token> *term();

    node<token> *match(token_type expected_token_type);

    void print();
};


#endif //TOKENIZER_PARSER_H
