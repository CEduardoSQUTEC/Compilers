#include <iostream>
#include <fstream>

using namespace std;

int yyparse();

int main(int argc, char **argv) {
	// if (argc != 2) {
	// 	cerr << argv[0] << ": Invalid number of arguments" << endl;
	// 	return 1;
	// }

	if ((argc > 1) && (freopen(argv[1], "r", stdin) == NULL)) {
		cerr << argv[0] << ": File " << argv[1] << " cannot be opened." << endl;
		return 1;
	}

	// string filename(argv[1]);
	// fstream input_file(filename, ios::in);

	// if (!input_file.is_open()) {
	// 	cerr << "error: Could not open file " << filename << endl;
	// 	return 1;
	// }

	yyparse();

	/**
	// Some pseudocode to base our tokenizer

	Lexer lexer(input_file);
	Token token;

	while ((token = lexer.get_next_token()) != Token::EOF) {
		cout << token << endl;
	}

	**/
	
	return 0;
}
