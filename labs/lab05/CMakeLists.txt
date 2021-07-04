cmake_minimum_required(VERSION 3.19)
project(lab05)

set(CMAKE_CXX_STANDARD 14)

add_executable(lab05 main.cpp symbol.cpp symbol.h rule.cpp rule.h grammar.cpp grammar.h ll1_table.cpp ll1_table.h syntax_analyzer.cpp syntax_analyzer.h)