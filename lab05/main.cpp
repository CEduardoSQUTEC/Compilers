#include <iostream>
#include <fstream>

#include "syntax_analyzer.h"

using namespace std;

int main(int argc, char **argv) {
    // Validate arguments
    if (argc != 2) {
        cerr << "error: Invalid number of arguments. Usage:" << argv[0] << " <grammar>" << endl;
        return 1;
    }

    // Receive file
    string grammar_filename(argv[1]);
//    string grammar_filename = "/Users/cesar.salcedo/Documents/courses/utec/2021-1/compiladores/repos/Compilers/lab05/grammar_test.bnf";
    fstream grammar_file(grammar_filename, ios::in);

    if (!grammar_file.is_open()) {
        cerr << "error: Could not open grammar file '" << grammar_filename << "'." << endl;
        return 1;
    }

    // Built grammar
    syntax_analyzer analyzer(grammar_file);

    // Receive input
    string input;

    while (getline(std::cin, input))
        cout << analyzer.parse(input) << endl;

    return 0;
}
