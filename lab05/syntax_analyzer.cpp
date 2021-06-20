//
// Created by ceduardosq on 6/18/21.
//

#include <fstream>
#include <sstream>
#include <vector>
#include <map>
#include "syntax_analyzer.h"

void syntax_analyzer::grammar_parse(std::istream &is) {
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
        }
        else {
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
            }
            else {
                derivation_symbol = it->second;
            }

            new_rule->add_derivation(derivation_symbol);
        }

        this->grammar_->add_rule(new_rule);
    }

    for (auto p : symbol_by_name) {
        if (p.second->getType() == symbol::symbol_type::non_terminal) {
            this->grammar_->add_non_terminal(p.second);
        }
        else {
            this->grammar_->add_terminal(p.second);
        }
    }
}

syntax_analyzer::syntax_analyzer(std::istream &is) {
    grammar_parse(is);
    table_ = new ll1_table(grammar_);
}

syntax_analyzer::~syntax_analyzer() {
    delete table_;
    delete grammar_;
}

