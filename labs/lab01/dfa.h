//
// Created by ceduardosq on 4/28/21.
//

#ifndef LAB01_DFA_H
#define LAB01_DFA_H

#include <unordered_map>
#include <unordered_set>
#include <string>

class dfa {
    char iState_{};
    std::unordered_set<char> finalState_{};
    std::unordered_map<char, std::unordered_map<std::string, char>> state_{};
public:
    dfa() = default;

    dfa(char iState, std::unordered_set<char> finalState);

    void addTransition(char beginState, const std::string &symbol, char endState);

    bool input(std::string in);
};


#endif //LAB01_DFA_H
