//
// Created by ceduardosq on 6/18/21.
//

#ifndef LAB05_SYMBOL_H
#define LAB05_SYMBOL_H

#include <string>

class symbol {
public:
    enum symbol_type {
        terminal, non_terminal
    };
private:
    std::string id_;
    symbol_type type_;
public:
    symbol(std::string id, symbol_type type);

    const std::string &getId() const;

    symbol_type getType() const;

    void setType(symbol_type type);
};


#endif //LAB05_SYMBOL_H
