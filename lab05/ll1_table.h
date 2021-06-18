//
// Created by ceduardosq on 6/18/21.
//

#ifndef LAB05_LL1_TABLE_H
#define LAB05_LL1_TABLE_H

#include <unordered_map>
#include <string>
#include "rule.h"

class ll1_table {
    /*
     * Todo
     * 1) First set (functions or constructors)
     * 2) Follow set
     * 3) explorer and extract errors
     */
    std::unordered_map<std::string, std::unordered_map<std::string, rule *>> table_;
private:

    rule *get_rule(symbol *non_terminal, symbol *terminal);

    void *set_rule(symbol *non_terminal, symbol *terminal);
};

#endif //LAB05_LL1_TABLE_H

