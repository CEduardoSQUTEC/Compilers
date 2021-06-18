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
    explicit grammar(symbol *initial);

    grammar(std::string *initial, const std::vector<std::string> &setNonTerminals,
            const std::vector<std::string> &setTerminals);

    void add_terminal(std::string terminal);

    void add_non_terminal(const std::string &non_terminal);

    void add_rule(rule *r);
};

#endif //LAB05_GRAMMAR_H
