//
// Created by ceduardosq on 6/18/21.
//

#ifndef LAB05_LL1_TABLE_H
#define LAB05_LL1_TABLE_H

#include <unordered_map>
#include <string>
#include <fstream>
#include <set>
#include <unordered_set>
#include "rule.h"
#include "grammar.h"


class ll1_table {
    /*
     * Todo
     * 1) First set (functions or constructors)
     * 2) Follow set
     * 3) explorer and extract errors
     */
    std::unordered_map<std::string, std::vector<symbol *>> first_set{};
    std::unordered_map<std::string, std::unordered_set<symbol *>> follow_set{};
    std::unordered_map<std::string, std::unordered_map<std::string, rule *>> table_{};
    bool status{};

    void build_first_set(grammar *);

    void build_follow_set(grammar *);

    bool verify();

    void error_recovery();

public:
    ll1_table() = default;

    ll1_table(grammar *grammar_);

    bool is_ll1_table();

    rule *get_rule(symbol *non_terminal, symbol *terminal);

    void *set_rule(symbol *non_terminal, symbol *terminal, rule *r);
};

#endif //LAB05_LL1_TABLE_H
