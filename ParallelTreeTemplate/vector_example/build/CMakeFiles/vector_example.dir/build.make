# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/linuxbrew/.linuxbrew/Cellar/cmake/3.17.1/bin/cmake

# The command to remove a file.
RM = /home/linuxbrew/.linuxbrew/Cellar/cmake/3.17.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/ParallelTreeTemplate/vector_example

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/ParallelTreeTemplate/vector_example/build

# Include any dependencies generated for this target.
include CMakeFiles/vector_example.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/vector_example.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vector_example.dir/flags.make

CMakeFiles/vector_example.dir/main.cpp.o: CMakeFiles/vector_example.dir/flags.make
CMakeFiles/vector_example.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/ParallelTreeTemplate/vector_example/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/vector_example.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/vector_example.dir/main.cpp.o -c /workspace/ParallelTreeTemplate/vector_example/main.cpp

CMakeFiles/vector_example.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/vector_example.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/ParallelTreeTemplate/vector_example/main.cpp > CMakeFiles/vector_example.dir/main.cpp.i

CMakeFiles/vector_example.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/vector_example.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/ParallelTreeTemplate/vector_example/main.cpp -o CMakeFiles/vector_example.dir/main.cpp.s

# Object files for target vector_example
vector_example_OBJECTS = \
"CMakeFiles/vector_example.dir/main.cpp.o"

# External object files for target vector_example
vector_example_EXTERNAL_OBJECTS =

vector_example: CMakeFiles/vector_example.dir/main.cpp.o
vector_example: CMakeFiles/vector_example.dir/build.make
vector_example: /workspace/ParallelTreeTemplate/lib/Linux_x86_64/libParallelTree.so
vector_example: CMakeFiles/vector_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/ParallelTreeTemplate/vector_example/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable vector_example"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vector_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vector_example.dir/build: vector_example

.PHONY : CMakeFiles/vector_example.dir/build

CMakeFiles/vector_example.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vector_example.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vector_example.dir/clean

CMakeFiles/vector_example.dir/depend:
	cd /workspace/ParallelTreeTemplate/vector_example/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/ParallelTreeTemplate/vector_example /workspace/ParallelTreeTemplate/vector_example /workspace/ParallelTreeTemplate/vector_example/build /workspace/ParallelTreeTemplate/vector_example/build /workspace/ParallelTreeTemplate/vector_example/build/CMakeFiles/vector_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/vector_example.dir/depend

