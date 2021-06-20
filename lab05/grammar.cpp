//
// Created by ceduardosq on 6/18/21.
//

#include "grammar.h"

grammar::grammar(symbol *initial) : initial_(initial) {}

void grammar::add_terminal(symbol *terminal) {
    set_non_terminals[terminal->getId()] = terminal;
}

void grammar::add_non_terminal(symbol *non_terminal) {
    set_non_terminals[non_terminal->getId()] = non_terminal;
}

void grammar::add_rule(rule *r) {
    rules_.push_back(r);
}

const std::vector<rule *> &grammar::getRules() const {
    return rules_;
}

const std::unordered_map<std::string, symbol *> &grammar::getSetNonTerminals() const {
    return set_non_terminals;
}

symbol *grammar::getInitial() const {
    return initial_;
}
