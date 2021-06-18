//
// Created by ceduardosq on 6/18/21.
//

#include "ll1_table.h"

rule *ll1_table::get_rule(symbol *non_terminal, symbol *terminal) {
    if (non_terminal->getType() != symbol::non_terminal || terminal->getType() != symbol::terminal) throw;

}

void *ll1_table::set_rule(symbol *non_terminal, symbol *terminal) {
    return nullptr;
}
