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
CMAKE_COMMAND = /snap/clion/152/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/152/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ceduardosq/Documents/classes/compilers/Compilers/lab05

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/lab05.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lab05.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lab05.dir/flags.make

CMakeFiles/lab05.dir/main.cpp.o: CMakeFiles/lab05.dir/flags.make
CMakeFiles/lab05.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/lab05.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab05.dir/main.cpp.o -c /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/main.cpp

CMakeFiles/lab05.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab05.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/main.cpp > CMakeFiles/lab05.dir/main.cpp.i

CMakeFiles/lab05.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab05.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/main.cpp -o CMakeFiles/lab05.dir/main.cpp.s

CMakeFiles/lab05.dir/symbol.cpp.o: CMakeFiles/lab05.dir/flags.make
CMakeFiles/lab05.dir/symbol.cpp.o: ../symbol.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/lab05.dir/symbol.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab05.dir/symbol.cpp.o -c /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/symbol.cpp

CMakeFiles/lab05.dir/symbol.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab05.dir/symbol.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/symbol.cpp > CMakeFiles/lab05.dir/symbol.cpp.i

CMakeFiles/lab05.dir/symbol.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab05.dir/symbol.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/symbol.cpp -o CMakeFiles/lab05.dir/symbol.cpp.s

CMakeFiles/lab05.dir/rule.cpp.o: CMakeFiles/lab05.dir/flags.make
CMakeFiles/lab05.dir/rule.cpp.o: ../rule.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/lab05.dir/rule.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab05.dir/rule.cpp.o -c /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/rule.cpp

CMakeFiles/lab05.dir/rule.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab05.dir/rule.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/rule.cpp > CMakeFiles/lab05.dir/rule.cpp.i

CMakeFiles/lab05.dir/rule.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab05.dir/rule.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/rule.cpp -o CMakeFiles/lab05.dir/rule.cpp.s

CMakeFiles/lab05.dir/grammar.cpp.o: CMakeFiles/lab05.dir/flags.make
CMakeFiles/lab05.dir/grammar.cpp.o: ../grammar.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/lab05.dir/grammar.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab05.dir/grammar.cpp.o -c /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/grammar.cpp

CMakeFiles/lab05.dir/grammar.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab05.dir/grammar.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/grammar.cpp > CMakeFiles/lab05.dir/grammar.cpp.i

CMakeFiles/lab05.dir/grammar.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab05.dir/grammar.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/grammar.cpp -o CMakeFiles/lab05.dir/grammar.cpp.s

CMakeFiles/lab05.dir/ll1_table.cpp.o: CMakeFiles/lab05.dir/flags.make
CMakeFiles/lab05.dir/ll1_table.cpp.o: ../ll1_table.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/lab05.dir/ll1_table.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab05.dir/ll1_table.cpp.o -c /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/ll1_table.cpp

CMakeFiles/lab05.dir/ll1_table.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab05.dir/ll1_table.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/ll1_table.cpp > CMakeFiles/lab05.dir/ll1_table.cpp.i

CMakeFiles/lab05.dir/ll1_table.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab05.dir/ll1_table.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/ll1_table.cpp -o CMakeFiles/lab05.dir/ll1_table.cpp.s

CMakeFiles/lab05.dir/syntax_analyzer.cpp.o: CMakeFiles/lab05.dir/flags.make
CMakeFiles/lab05.dir/syntax_analyzer.cpp.o: ../syntax_analyzer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/lab05.dir/syntax_analyzer.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lab05.dir/syntax_analyzer.cpp.o -c /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/syntax_analyzer.cpp

CMakeFiles/lab05.dir/syntax_analyzer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lab05.dir/syntax_analyzer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/syntax_analyzer.cpp > CMakeFiles/lab05.dir/syntax_analyzer.cpp.i

CMakeFiles/lab05.dir/syntax_analyzer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lab05.dir/syntax_analyzer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/syntax_analyzer.cpp -o CMakeFiles/lab05.dir/syntax_analyzer.cpp.s

# Object files for target lab05
lab05_OBJECTS = \
"CMakeFiles/lab05.dir/main.cpp.o" \
"CMakeFiles/lab05.dir/symbol.cpp.o" \
"CMakeFiles/lab05.dir/rule.cpp.o" \
"CMakeFiles/lab05.dir/grammar.cpp.o" \
"CMakeFiles/lab05.dir/ll1_table.cpp.o" \
"CMakeFiles/lab05.dir/syntax_analyzer.cpp.o"

# External object files for target lab05
lab05_EXTERNAL_OBJECTS =

lab05: CMakeFiles/lab05.dir/main.cpp.o
lab05: CMakeFiles/lab05.dir/symbol.cpp.o
lab05: CMakeFiles/lab05.dir/rule.cpp.o
lab05: CMakeFiles/lab05.dir/grammar.cpp.o
lab05: CMakeFiles/lab05.dir/ll1_table.cpp.o
lab05: CMakeFiles/lab05.dir/syntax_analyzer.cpp.o
lab05: CMakeFiles/lab05.dir/build.make
lab05: CMakeFiles/lab05.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable lab05"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lab05.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lab05.dir/build: lab05

.PHONY : CMakeFiles/lab05.dir/build

CMakeFiles/lab05.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lab05.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lab05.dir/clean

CMakeFiles/lab05.dir/depend:
	cd /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ceduardosq/Documents/classes/compilers/Compilers/lab05 /home/ceduardosq/Documents/classes/compilers/Compilers/lab05 /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug /home/ceduardosq/Documents/classes/compilers/Compilers/lab05/cmake-build-debug/CMakeFiles/lab05.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lab05.dir/depend
