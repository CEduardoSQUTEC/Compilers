//
// Created by ceduardosq on 5/18/21.
//

#include "lexer.h"
#include "stdexcept"

lexer::lexer(std::string input) : current_idx(0), input(std::move(input)) {}

token lexer::get_next_token() {
    if (current_idx >= input.length()) return token(token_type::TOKENEOF, "EOF");

    while (input[current_idx] == ' ') current_idx++;

    switch (input[current_idx]) {
        case '\n':
            return token(token_type::)
        case '+':
        case '-':
        case '*':
        case '/':
        case '%':
            return token(token_type::OPMATH, std::string(1, input[current_idx++]));
        case '<':
        case '>':
        case '=': {
            size_t begin = current_idx;
            current_idx++;
            if (input[current_idx] == '=') {
                current_idx++;
                return token(token_type::OPRELOP, std::string(input, begin, 2));
            }
            token_type return_token = input[begin] == '=' ? token_type::ASSIGN : token_type::OPRELOP;
            return token(return_token, std::string(1, input[begin]));
        }
        case '(':
            current_idx++;
            return token(token_type::PAROPEN, "(");
        case ')':
            current_idx++;
            return token(token_type::PARCLOSE, ")");
        default: {
            size_t begin = current_idx;
            if (isalpha(input[current_idx]) || input[current_idx] == '_') {
                do current_idx++;
                while (isdigit(input[current_idx]) || isalpha(input[current_idx]) || input[current_idx] == '_');
                return token(token_type::ID, std::string(input, begin, current_idx - begin));
            } else if (isdigit(input[current_idx]) || input[current_idx] == '.') {
                while (isdigit(input[current_idx])) current_idx++;
                if (input[current_idx] != '.' && input[current_idx] != 'E' && input[current_idx] != 'e')
                    return token(token_type::NUMBER, std::string(input, begin, current_idx - begin));
                if (input[current_idx] == '.') {
                    do current_idx++;
                    while (isdigit(input[current_idx]));
                    if (current_idx == begin + 1) throw std::invalid_argument("Invalid token");
                    if (!isdigit(input[current_idx]) && input[current_idx] != 'E' && input[current_idx] != 'e')
                        return token(token_type::NUMBER, input.substr(begin, current_idx - begin));
                }
                if (input[current_idx] == 'E' || input[current_idx] == 'e') {
                    current_idx++;
                    if (input[current_idx] == '+' || input[current_idx] == '-') current_idx++;
                    if (!isdigit(input[current_idx])) throw std::invalid_argument("Invalid token");
                    while (isdigit(input[current_idx])) current_idx++;
                }
                return token(token_type::NUMBER, input.substr(begin, current_idx - begin));
            }
        }
    }
    throw std::invalid_argument("Invalid token");
}
