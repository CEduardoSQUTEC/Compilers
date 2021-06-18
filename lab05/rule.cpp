//
// Created by ceduardosq on 6/18/21.
//

#include "rule.h"

#include <utility>

rule::rule(symbol *state) : state_(state) {}

void rule::add_derivation(symbol *sym) { derivation_.push_back(sym); }

rule::rule(symbol *state, std::vector<symbol *> derivation) : state_(state), derivation_(std::move(derivation)) {}
