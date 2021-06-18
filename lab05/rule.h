//
// Created by ceduardosq on 6/18/21.
//

#ifndef LAB05_RULE_H
#define LAB05_RULE_H

#include "symbol.h"
#include <vector>

class rule {
    symbol *state_;
    std::vector<symbol *> derivation_;
public:
    explicit rule(symbol *state);

    rule(symbol *state, std::vector<symbol *> derivation);

    void add_derivation(symbol *sym);
};

#endif //LAB05_RULE_H
