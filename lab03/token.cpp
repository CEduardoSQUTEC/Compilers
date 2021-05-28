//
// Created by ceduardosq on 5/18/21.
//

#include "token.h"

#include <utility>

token::token(token_type type, std::string value) : type_(type), value_(std::move(value)) {}

token_type token::getType() const {
    return type_;
}

const std::string &token::getValue() const {
    return value_;
}

std::ostream &operator<<(std::ostream &os, token &t) {
    os << t.to_string();
    return os;
}
