//
// Created by ceduardosq on 4/28/21.
//

#include "dfa.h"

#include <utility>

dfa::dfa(char iState, std::unordered_set<char> finalState) : iState_(iState), finalState_(std::move(finalState)) {}

void dfa::addTransition(char beginState, const std::string &symbol, char endState) {
    state_[beginState][symbol] = endState;
}

bool dfa::input(std::string in) {
    char currentState = iState_;
    for (int i = 0; i < in.size(); i += 2) {
        std::string sym{};
        sym += in[i];
        sym += in[i + 1];
        if (state_[currentState].find(sym) == state_[currentState].end()) return false;
        currentState = state_[currentState][sym];
    }
    return finalState_.find(currentState) != finalState_.end();
}
