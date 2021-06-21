//
// Created by ceduardosq on 6/18/21.
//

#include "ll1_table.h"

void ll1_table::build_first_set(grammar *grammar) {
    symbol *initial = grammar->getInitial();
    const auto& non_terminal_map = grammar->getSetNonTerminals();

    for(auto &nt: non_terminal_map) first_set[nt.first] = {nt.second};

    bool flag = true;
    while (flag) {
        flag = false;



    }
}

void ll1_table::build_follow_set(grammar *grammar) {
    symbol *initial = grammar->getInitial();
    auto non_terminal_map = grammar->getSetNonTerminals();

    for (auto p : non_terminal_map) {
        if (p.second == initial) {
            this->follow_set[initial->getId()] = {non_terminal_map["$"]};
        }
        else {
            this->follow_set[initial->getId()] = {};
        }
    }

    // TODO: Finish implementation
    /**
     *  while existan cambios
     *      for cada seleccion de produccion A -> X1 X2 ... Xn do
     *          for each Xi que sea un no terminal do
     *              agregar Primero(Xi+1 Xi+2 ... Xn) - {epsilon} a Siguiente(Xn)
     *              if epsilon esta en Primero(Xi+1 Xi+2 ... Xn) then
     *                  agregue Siguiente(A) a Siguiente(Xi)
     *
     *  // Note que si i=n, entonces Xi+1 Xi+2 ... Xn = e
     */
}

void ll1_table::error_recovery() {

}

ll1_table::ll1_table(grammar *grammar_) {
    build_first_set(grammar_);
    build_follow_set(grammar_);
    status = verify();
    error_recovery();
}

bool ll1_table::verify() {
    return false;
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
