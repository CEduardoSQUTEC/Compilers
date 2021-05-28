//
// Created by César Salcedo on 5/19/21.
//

#include "parser.h"
#include "node.h"

#include <utility>

parser::parser(lexer lexer) : lexer_(std::move(lexer)) {
    current_token_ = lexer_.get_next_token();
}

void parser::parse() {
    root_ = S();
}

node<token> *parser::exp() {
    return nullptr;
}

node<token> *parser::op_sum() {
    return nullptr;
}

node<token> *parser::term() {
    switch (current_token_.getType()) {
        case token_type::ID:
        case token_type::NUMBER:
            return match(current_token_.getType());
        default:
            throw std::invalid_argument("Invalid syntax");
    }
}

node<token> *parser::op_mul() {
    return nullptr;
}

node<token> *parser::factor() {
    return nullptr;
}

node<token> *parser::S() {
    node<token> *s = term();
    while (current_token_.getType() == token_type::OPRELOP) {
        node<token> *oprelop = match(token_type::OPRELOP);
        oprelop->add_child(s);
        s = oprelop;
        s->add_child(term());
    }
    return s;
}

node<token> *parser::match(token_type expected_token_type) {
    if (current_token_.getType() == expected_token_type) {
        auto new_node = new node<token>(current_token_);
        current_token_ = lexer_.get_next_token();
        return new_node;
    } else throw std::invalid_argument("Invalid syntax");
}

void parser::print() {
    root_->print();
}

