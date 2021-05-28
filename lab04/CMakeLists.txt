cmake_minimum_required(VERSION 3.19)
project(tokenizer)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(tokenizer
        lexer.cpp
        lexer.h
        main.cpp
        token.cpp
        token.h
        parser.cpp
        parser.h
        node.h
        )
