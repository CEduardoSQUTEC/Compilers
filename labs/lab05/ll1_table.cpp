//
// Created by ceduardosq on 6/18/21.
//

#include "ll1_table.h"

bool ll1_table::add_set_to_set_without_void(std::unordered_set<symbol *> &b, std::unordered_set<symbol *> &a) {
    bool is_there_void = false;
    for (auto &e: b) {
        if (e->getId() == "@") is_there_void = true;
        a.insert(e);
    }
    return is_there_void;
}

void ll1_table::build_first_set(grammar *grammar_) {
    const auto &non_terminal_map = grammar_->getSetNonTerminals();
    auto terminal_map = grammar_->getSetTerminals();
    for (auto &nt: non_terminal_map) first_set[nt.first];

    const auto &rules = grammar_->getRules();

    bool flag = true;
    while (flag) {
        flag = false;
        for (auto &r: rules) {
            auto state = r->getState();
            const auto &X = r->getDerivation();
            int initial_size = first_set[state->getId()].size();

            int k = 0;
            bool cont = true;
            while (cont && k < X.size()) {
                if (X[k]->getType() == symbol::symbol_type::non_terminal) {
                    if (!add_set_to_set_without_void(first_set[X[k]->getId()], first_set[state->getId()]))
                        cont = false;
                } else {
                    if (X[k]->getId() != "@") {
                        first_set[state->getId()].insert(X[k]);
                        cont = false;
                    }
                }
                k++;
            }
            if (cont) first_set[state->getId()].insert(terminal_map["@"]);
            if (initial_size != first_set[state->getId()].size()) flag = true;
        }
    }

}

void ll1_table::build_follow_set(grammar *grammar) {
    symbol *initial = grammar->getInitial();
    auto non_terminal_map = grammar->getSetNonTerminals();
    auto terminal_map = grammar->getSetTerminals();

    for (auto p : non_terminal_map) {
        if (p.second == initial) {
            this->follow_set[p.second->getId()] = {terminal_map["$"]};
        } else {
            this->follow_set[p.second->getId()] = {};
        }
    }

    int i = 0, loops_unchanged = 1;
    auto rules = grammar->getRules();
    int num_rules = rules.size();
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
}

void ll1_table::error_recovery() {

}

ll1_table::ll1_table(grammar *grammar_) {
    build_first_set(grammar_);
    build_follow_set(grammar_);
    status = verify();
    error_recovery();



    auto non_terminal_map = grammar_->getSetNonTerminals();
    auto terminal_map = grammar_->getSetTerminals();
    auto rules = grammar_->getRules();

    auto epsilon = terminal_map["@"];
    terminal_map.erase("@");

    for (auto r : rules) {
        auto derivation = r->getDerivation();
        if (derivation[0]->getId() == epsilon->getId()) continue;
        if (derivation[0]->getType() == symbol::symbol_type::terminal) {
            this->table_[r->getState()->getId()][derivation[0]->getId()] = r;
        } else {
            for (auto &e : this->first_set[derivation[0]->getId()]) {
                this->table_[r->getState()->getId()][e->getId()] = r;
            }
        }
    }

    for (auto r : rules) {
        auto derivation = r->getDerivation();
        if (derivation[0]->getType() == symbol::symbol_type::terminal) {
            if (derivation[0]->getId() == epsilon->getId()) {
                for (auto &e : this->follow_set[r->getState()->getId()]) {
                    this->table_[r->getState()->getId()][e->getId()] = r;
                }
            }
        } else {
            auto mapa = this->first_set[derivation[0]->getId()];
            if (mapa.find(epsilon) != mapa.end()) {
                for (auto &e : this->follow_set[r->getState()->getId()]) {
                    this->table_[r->getState()->getId()][e->getId()] = r;
                }
            }
        }
    }
}

bool ll1_table::verify() {
    return false;
}

bool ll1_table::is_ll1_table() {
    return status;
}

rule *ll1_table::get_rule(symbol *non_terminal, symbol *terminal) {
//    if (non_terminal->getType() != symbol::non_terminal || terminal->getType() != symbol::terminal) return nullptr;

    if (this->table_[non_terminal->getId()].find(terminal->getId()) == this->table_[non_terminal->getId()].end()) return nullptr;
    return this->table_[non_terminal->getId()][terminal->getId()];
}

void *ll1_table::set_rule(symbol *non_terminal, symbol *terminal, rule *r) {
    return nullptr;
}

