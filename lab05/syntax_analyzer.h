//
// Created by ceduardosq on 6/18/21.
//

#ifndef LAB05_SYNTAX_ANALYZER_H
#define LAB05_SYNTAX_ANALYZER_H

#include "ll1_table.h"
#include "grammar.h"
#include <fstream>

class syntax_analyzer {
    ll1_table *table_;
    grammar *grammar_;

    void grammar_parse(std::istream &is);

public:
    syntax_analyzer(std::istream &is);

    ~syntax_analyzer();

    /*
     * Facade
     * C++ or file should be here
     * Analyser build everything.
     * Two constructors
     */
};


#endif //LAB05_SYNTAX_ANALYZER_H
