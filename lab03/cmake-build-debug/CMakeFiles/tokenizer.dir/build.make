# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/151/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/151/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ceduardosq/Documents/classes/compilers/lab03

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/tokenizer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tokenizer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tokenizer.dir/flags.make

CMakeFiles/tokenizer.dir/lexer.cpp.o: CMakeFiles/tokenizer.dir/flags.make
CMakeFiles/tokenizer.dir/lexer.cpp.o: ../lexer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/tokenizer.dir/lexer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tokenizer.dir/lexer.cpp.o -c /home/ceduardosq/Documents/classes/compilers/lab03/lexer.cpp

CMakeFiles/tokenizer.dir/lexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tokenizer.dir/lexer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/lab03/lexer.cpp > CMakeFiles/tokenizer.dir/lexer.cpp.i

CMakeFiles/tokenizer.dir/lexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tokenizer.dir/lexer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/lab03/lexer.cpp -o CMakeFiles/tokenizer.dir/lexer.cpp.s

CMakeFiles/tokenizer.dir/main.cpp.o: CMakeFiles/tokenizer.dir/flags.make
CMakeFiles/tokenizer.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/tokenizer.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tokenizer.dir/main.cpp.o -c /home/ceduardosq/Documents/classes/compilers/lab03/main.cpp

CMakeFiles/tokenizer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tokenizer.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/lab03/main.cpp > CMakeFiles/tokenizer.dir/main.cpp.i

CMakeFiles/tokenizer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tokenizer.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/lab03/main.cpp -o CMakeFiles/tokenizer.dir/main.cpp.s

CMakeFiles/tokenizer.dir/token.cpp.o: CMakeFiles/tokenizer.dir/flags.make
CMakeFiles/tokenizer.dir/token.cpp.o: ../token.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/tokenizer.dir/token.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tokenizer.dir/token.cpp.o -c /home/ceduardosq/Documents/classes/compilers/lab03/token.cpp

CMakeFiles/tokenizer.dir/token.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tokenizer.dir/token.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/lab03/token.cpp > CMakeFiles/tokenizer.dir/token.cpp.i

CMakeFiles/tokenizer.dir/token.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tokenizer.dir/token.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/lab03/token.cpp -o CMakeFiles/tokenizer.dir/token.cpp.s

CMakeFiles/tokenizer.dir/parser.cpp.o: CMakeFiles/tokenizer.dir/flags.make
CMakeFiles/tokenizer.dir/parser.cpp.o: ../parser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/tokenizer.dir/parser.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tokenizer.dir/parser.cpp.o -c /home/ceduardosq/Documents/classes/compilers/lab03/parser.cpp

CMakeFiles/tokenizer.dir/parser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tokenizer.dir/parser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/lab03/parser.cpp > CMakeFiles/tokenizer.dir/parser.cpp.i

CMakeFiles/tokenizer.dir/parser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tokenizer.dir/parser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/lab03/parser.cpp -o CMakeFiles/tokenizer.dir/parser.cpp.s

# Object files for target tokenizer
tokenizer_OBJECTS = \
"CMakeFiles/tokenizer.dir/lexer.cpp.o" \
"CMakeFiles/tokenizer.dir/main.cpp.o" \
"CMakeFiles/tokenizer.dir/token.cpp.o" \
"CMakeFiles/tokenizer.dir/parser.cpp.o"

# External object files for target tokenizer
tokenizer_EXTERNAL_OBJECTS =

tokenizer: CMakeFiles/tokenizer.dir/lexer.cpp.o
tokenizer: CMakeFiles/tokenizer.dir/main.cpp.o
tokenizer: CMakeFiles/tokenizer.dir/token.cpp.o
tokenizer: CMakeFiles/tokenizer.dir/parser.cpp.o
tokenizer: CMakeFiles/tokenizer.dir/build.make
tokenizer: CMakeFiles/tokenizer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable tokenizer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tokenizer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tokenizer.dir/build: tokenizer

.PHONY : CMakeFiles/tokenizer.dir/build

CMakeFiles/tokenizer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tokenizer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tokenizer.dir/clean

CMakeFiles/tokenizer.dir/depend:
	cd /home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ceduardosq/Documents/classes/compilers/lab03 /home/ceduardosq/Documents/classes/compilers/lab03 /home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug /home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug /home/ceduardosq/Documents/classes/compilers/lab03/cmake-build-debug/CMakeFiles/tokenizer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tokenizer.dir/depend
