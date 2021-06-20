//
// Created by ceduardosq on 6/18/21.
//

#include "ll1_table.h"

void ll1_table::build_first_set() {

}

void ll1_table::build_follow_set() {

}

void ll1_table::error_recovery() {

}

ll1_table::ll1_table(grammar *grammar_) {
    build_first_set();
    build_follow_set();
    status = verify();
    error_recovery();
}

bool ll1_table::is_ll1_table() {
    return status;
}

rule *ll1_table::get_rule(symbol *non_terminal, symbol *terminal) {
    if (non_terminal->getType() != symbol::non_terminal || terminal->getType() != symbol::terminal) throw;
}

void *ll1_table::set_rule(symbol *non_terminal, symbol *terminal, rule *r) {
    return nullptr;
}
