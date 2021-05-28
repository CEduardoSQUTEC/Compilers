#include <iostream>
#include <string>
#include <cctype>

using namespace std;

class Token {
public:
	string token;
	string value;

	Token(string token, string value) {
		this->token = token;
		this->value = value;
	}
};
		
Token relop_token(string s) {
	if (s[0] == '<') {
		if (s.length() > 1 && s[1] == '=') return Token("relop", "LE");

		return Token("relop", "LT");
	}
	else if (s[0] == '>') {
		if (s.length() > 1 && s[1] == '=') return Token("relop", "GE");

		return Token("relop", "GT");
	}
	else if (s.length() > 1 && s[0] == '=' && s[1] == '=') return Token("relop", "EQ");
	return Token("Invalid", "");
}

Token id_token(string s) {
	if (!isalpha(s[0])) return Token("Invalid", "");

	int pos = 1;

	while (pos < s.length() && (isalpha(s[pos]) || isdigit(s[pos]))) {
		pos++;
	}

	return Token("id", s);
}


Token num_token(string s) {
	int pos = 0;

	if (s.length() == 0 || !isdigit(s[pos])) return Token("Invalid", "");
	while (pos < s.length() && isdigit(s[pos])) {
		pos++;
	}
	if (pos == s.length()) return Token("num", s);

	if (s[pos] != '.' && s[pos] != 'E') return Token("Invalid", "");
	if (s[pos] == '.') {
		pos++;
		if (pos == s.length() || !isdigit(s[pos])) return Token("Invalid", "");
		while (pos < s.length() && isdigit(s[pos])) {
			pos++;
		}
		if (pos == s.length()) return Token("num", s);
	}

	if (s[pos] == 'E') {
		pos++;
		if (pos == s.length()) return Token("Invalid", "");
		if (s[pos] == '+' || s[pos] == '-') pos++;
		if (!isdigit(s[pos])) return Token("Invalid", "");
		while (pos < s.length() && isdigit(s[pos])) {
			pos++;
		}
		if (pos == s.length()) return Token("num", s);
	}

	return Token("Invalid", "");
}

int main() {
	string s;

	while (getline(cin, s)) {
		auto token_relop = relop_token(s);
		auto token_id = id_token(s);
		auto token_n = num_token(s);
		if (token_relop.token != "Invalid")
			cout << token_relop.token << ' ' << token_relop.value << endl;
		else if (token_id.token != "Invalid")
			cout << token_id.token << ' ' << token_id.value << endl;
		else if (token_n.token != "Invalid")
			cout << token_n.token << ' ' << token_n.value << endl;
	}
	return 0;
}
