//
// Created by ceduardosq on 5/18/21.
//

#ifndef LAB03_TOKEN_H
#define LAB03_TOKEN_H

#include <string>
#include <fstream>

enum class token_type {
    OPMATH,
    PAROPEN,
    PARCLOSE,
    NUMBER,
    ASSIGN,
    OPRELOP,
    ID,
    IF,
    ELSE,
    TOKENEOF,
    NEWLINE
};

class token {
    token_type type_{};
    std::string value_{};
public:
    token() = default;

    token(token_type type, std::string value);

    token_type getType() const;

    const std::string &getValue() const;

    std::string to_string() {
        std::string output = "<";
        switch (type_) {
            case token_type::OPMATH:
                output += "OPMATH";
                break;
            case token_type::PAROPEN:
                output += "PAROPEN";
                break;
            case token_type::PARCLOSE:
                output += "PARCLOSE";
                break;
            case token_type::NUMBER:
                output += "NUMBER";
                break;
            case token_type::ASSIGN:
                output += "ASSIGN";
                break;
            case token_type::OPRELOP:
                output += "OPRELOP";
                break;
            case token_type::ID:
                output += "ID";
                break;
            case token_type::IF:
                output += "IF";
                break;
            case token_type::ELSE:
                output += "ELSE";
                break;
            case token_type::TOKENEOF:
                output += "TOKENEOF";
                break;
            case token_type::NEWLINE:
                return "\n";
        }
        output += " " + value_ + ">";
        return output;
    }

};

std::ostream &operator<<(std::ostream &os, token &t);

#endif //LAB03_TOKEN_H
