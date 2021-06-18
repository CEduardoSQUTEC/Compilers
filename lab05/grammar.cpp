//
// Created by ceduardosq on 6/18/21.
//

#include "grammar.h"

grammar::grammar(symbol *initial) : initial_(initial) {}

void grammar::add_terminal(symbol *terminal) {
    set_terminals.push_back(terminal);
}

void grammar::add_non_terminal(symbol *non_terminal) {
    set_non_terminals.push_back(non_terminal);
}

void grammar::add_rule(rule *r) {
    rules_.push_back(r);
}

void grammar::add_terminal(std::string terminal) {

}

grammar::grammar(std::string initial, const std::vector<std::string> &setNonTerminals,
                 const std::vector<std::string> &setTerminals) : initial_(
        initial), set_non_terminals(setNonTerminals), set_terminals(setTerminals) {}

void grammar::add_non_terminal(const std::string& non_terminal) {

}
