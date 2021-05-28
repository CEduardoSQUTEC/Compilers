#include <iostream>
#include "dfa.h"

int main() {
    dfa lab01('A', {'E', 'F'});
    lab01.addTransition('A', "bl", 'A');
    lab01.addTransition('A', "br", 'B');
    lab01.addTransition('A', "hs", 'C');
    lab01.addTransition('B', "br", 'B');
    lab01.addTransition('B', "bl", 'B');
    lab01.addTransition('B', "hs", 'C');
    lab01.addTransition('B', "fe", 'C');
    lab01.addTransition('B', "tu", 'C');
    lab01.addTransition('B', "fs", 'D');
    lab01.addTransition('C', "fe", 'C');
    lab01.addTransition('C', "tu", 'C');
    lab01.addTransition('C', "fs", 'D');
    lab01.addTransition('D', "bl", 'D');
    lab01.addTransition('D', "br", 'E');
    lab01.addTransition('E', "bl", 'E');
    lab01.addTransition('E', "br", 'E');
    lab01.addTransition('E', "sp", 'F');

    while (true) {
        std::string in{};
        std::cout << "Input: ";
        std::cin >> in;
        if (in.empty()) break;
        std::cout << "Output: " << lab01.input(in) << '\n';
    }
    return 0;
}
