//
// Created by ceduardosq on 6/18/21.
//

#include <fstream>
#include <sstream>
#include <map>
#include <stack>
#include "syntax_analyzer.h"

void syntax_analyzer::grammar_parse(std::fstream &is) {
    std::string line;
    std::map<std::string, symbol *> symbol_by_name;

    while (getline(is, line)) {
        std::stringstream ss(line);

        std::string name;

        // Receive non-terminal
        ss >> name;

        auto it = symbol_by_name.find(name);
        symbol *rule_symbol;

        if (it == symbol_by_name.end()) {
            rule_symbol = new symbol(name, symbol::symbol_type::non_terminal);

            if (this->grammar_ == nullptr) {
                this->grammar_ = new grammar(rule_symbol);
            }

            symbol_by_name[name] = rule_symbol;
        } else {
            rule_symbol = it->second;
            rule_symbol->setType(symbol::symbol_type::non_terminal);
        }

        rule *new_rule = new rule(rule_symbol);

        // Process arrow: ->
        // TODO: validate if it is indeed an arrow
        ss >> name;

        // Receive derivation
        while (ss >> name) {
            symbol *derivation_symbol;

            it = symbol_by_name.find(name);

            if (it == symbol_by_name.end()) {
                derivation_symbol = new symbol(name, symbol::symbol_type::terminal);
                symbol_by_name[name] = derivation_symbol;
            } else {
                derivation_symbol = it->second;
            }

            new_rule->add_derivation(derivation_symbol);
        }

        this->grammar_->add_rule(new_rule);
    }

    for (auto p : symbol_by_name) {
        if (p.second->getType() == symbol::symbol_type::non_terminal) {
            this->grammar_->add_non_terminal(p.second);
        } else {
            this->grammar_->add_terminal(p.second);
        }
    }

    this->grammar_->add_terminal(new symbol("@", symbol::symbol_type::terminal));
    this->grammar_->add_terminal(new symbol("$", symbol::symbol_type::terminal));
}

syntax_analyzer::syntax_analyzer(std::fstream &is) : grammar_(nullptr) {
    grammar_parse(is);
    table_ = new ll1_table(grammar_);
}

syntax_analyzer::~syntax_analyzer() {
    delete table_;
    delete grammar_;
}

bool syntax_analyzer::parse(std::string input) {
    std::stringstream ss(input);

    auto symbols_map = this->grammar_->getSetNonTerminals();
    symbols_map.insert(this->grammar_->getSetTerminals().begin(), this->grammar_->getSetTerminals().end());

    symbol *end_symbol = symbols_map["$"];


    std::stack<symbol *> pila;
    pila.push(end_symbol);
    pila.push(this->grammar_->getInitial());
    std::string s;
    ss >> s;
    while (pila.top() != end_symbol) {
        if (pila.top()->getId() == s) {
            pila.pop();
            ss >> s;
        }
        else if (pila.top()->getType() == symbol::symbol_type::terminal) {
            return false;
        }
        // else if (M[N,T] es un error) { error }
        else {
            symbol *ter = symbols_map[s];
            rule *r = this->table_->get_rule(pila.top(), ter);
            pila.pop();
            for (auto derivation : r->getDerivation()) {
                pila.push(derivation);
            }
        }
    }

    return true;
}
