//
// Created by ceduardosq on 5/18/21.
//

#ifndef LAB03_LEXER_H
#define LAB03_LEXER_H

#include <string>
#include <utility>
#include "token.h"

class lexer {
    size_t current_idx;
    std::string input;
public:
    lexer() = default;
    explicit lexer(std::string input);

    token get_next_token();
};

#endif //LAB03_LEXER_H
