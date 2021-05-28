//
// Created by César Salcedo on 5/19/21.
//

#ifndef TOKENIZER_NODE_H
#define TOKENIZER_NODE_H

#include <vector>
#include <iostream>

template<typename T>
class node {
    T value_{};
    std::vector<node<T> *> children_{};

    void kill() {
        for (auto child : children_)
            if (child != nullptr) child->kill();
        delete this;
    }

public:
    node(T value) : value_(value) {}

    void add_child(node<T> *node) { children_.push_back(node); }

    void print(int depth = 0) {
        for (int i = 0; i < depth - 1; i++)
            std::cout << "|   ";
        if (depth > 0) {
            std::cout << "L---";
        }
        std::cout << this->value_ << std::endl;
        for (auto child : children_) {
            if (child != nullptr) {
                child->print(depth + 1);
            }
        }
    }

    ~node() { kill(); }
};

#endif //TOKENIZER_NODE_H
