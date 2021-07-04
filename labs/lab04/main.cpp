#include <iostream>
#include "parser.h"
#include "lexer.h"

int main() {
    std::string input{};
    while (getline(std::cin, input)) {
        lexer lex(input);
        parser par(lex);
        par.parse();
        par.print();
    }
    return 0;
}
