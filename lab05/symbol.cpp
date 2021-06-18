//
// Created by ceduardosq on 6/18/21.
//

#include "symbol.h"

#include <utility>

const std::string &symbol::getId() const {
    return id_;
}

symbol::symbol_type symbol::getType() const {
    return type_;
}

symbol::symbol(std::string id, symbol::symbol_type type) : id_(std::move(id)), type_(type) {}
