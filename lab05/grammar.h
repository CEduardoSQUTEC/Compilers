//
// Created by ceduardosq on 6/18/21.
//

#ifndef LAB05_GRAMMAR_H
#define LAB05_GRAMMAR_H

#include "symbol.h"
#include "rule.h"
#include <unordered_map>
#include <vector>

class grammar {
    symbol *initial_;
    std::unordered_map<std::string, symbol *> set_non_terminals;
    std::unordered_map<std::string, symbol *> set_terminals;
    std::vector<rule *> rules_;
public:
    grammar() = default;
    grammar(symbol *initial);

    void add_terminal(symbol *terminal);

    void add_non_terminal(symbol *non_terminal);

    void add_rule(rule *r);

    const std::vector<rule *> &getRules() const;
};

#endif //LAB05_GRAMMAR_H
