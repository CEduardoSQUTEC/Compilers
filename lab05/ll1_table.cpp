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

    int i = 0, loops_unchanged = 1;
    auto rules = grammar->getRules();
    int num_rules = rules.size();
    auto terminal_map = grammar->getSetTerminals();
    symbol *epsilon = terminal_map["@"];

    while (loops_unchanged <= num_rules) {
        rule *rule = rules[i];

        auto derivation = rule->getDerivation();
        for (int d_i = 0; d_i < derivation.size(); d_i++) {
            if (derivation[d_i]->getType() == symbol::symbol_type::non_terminal) {
                int j = d_i + 1;
                std::unordered_set<symbol *> final_first_set = {epsilon};

                // While there are epsilons, add first sets and advance to next symbol
                while (j < derivation.size()) {
                    if (derivation[j]->getType() == symbol::symbol_type::terminal) {
                        final_first_set.insert(derivation[j]);
                        break;
                    }
                    std::unordered_set<symbol *> &current_set = this->first_set[derivation[j]->getId()];

                    final_first_set.insert(current_set.begin(), current_set.end());

                    if (current_set.find(epsilon) == current_set.end()) break;
                    j++;
                }

                // Erase epsilon
                final_first_set.erase(epsilon);

                int current_size = this->follow_set[derivation[d_i]->getId()].size();
                this->follow_set[derivation[d_i]->getId()].insert(final_first_set.begin(), final_first_set.end());

                // If epsilon is in Primero(Xi+1 Xi+2 ... Xn)
                if (j == derivation.size()) {
                    auto rule_first_set = this->follow_set[rule->getState()->getId()];
                    this->follow_set[derivation[d_i]->getId()].insert(rule_first_set.begin(), rule_first_set.end());
                }

                // If some element is added to the follow set, continue iterating
                if (current_size != this->follow_set[derivation[d_i]->getId()].size()) {
                    loops_unchanged = 0;
                }
            }
        }

        i = (i + 1) % num_rules;
        loops_unchanged++;
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
