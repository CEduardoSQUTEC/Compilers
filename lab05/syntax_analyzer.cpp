//
// Created by ceduardosq on 6/18/21.
//

#include <fstream>
#include "syntax_analyzer.h"

void syntax_analyzer::grammar_parse(std::istream &is) {

}

syntax_analyzer::syntax_analyzer(std::istream &is) {
    grammar_parse(is);
    table_ = new ll1_table(grammar_);
}

syntax_analyzer::~syntax_analyzer() {
    delete table_;
    delete grammar_;
}

