# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ajackow/workspace/RedFollow

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ajackow/workspace/RedFollow

# Include any dependencies generated for this target.
include CMakeFiles/SerialDriver.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/SerialDriver.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SerialDriver.dir/flags.make

CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o: CMakeFiles/SerialDriver.dir/flags.make
CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o: SerialDriver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ajackow/workspace/RedFollow/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o -c /home/ajackow/workspace/RedFollow/SerialDriver.cpp

CMakeFiles/SerialDriver.dir/SerialDriver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SerialDriver.dir/SerialDriver.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ajackow/workspace/RedFollow/SerialDriver.cpp > CMakeFiles/SerialDriver.dir/SerialDriver.cpp.i

CMakeFiles/SerialDriver.dir/SerialDriver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SerialDriver.dir/SerialDriver.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ajackow/workspace/RedFollow/SerialDriver.cpp -o CMakeFiles/SerialDriver.dir/SerialDriver.cpp.s

CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.requires:

.PHONY : CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.requires

CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.provides: CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.requires
	$(MAKE) -f CMakeFiles/SerialDriver.dir/build.make CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.provides.build
.PHONY : CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.provides

CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.provides.build: CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o


# Object files for target SerialDriver
SerialDriver_OBJECTS = \
"CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o"

# External object files for target SerialDriver
SerialDriver_EXTERNAL_OBJECTS =

libSerialDriver.a: CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o
libSerialDriver.a: CMakeFiles/SerialDriver.dir/build.make
libSerialDriver.a: CMakeFiles/SerialDriver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ajackow/workspace/RedFollow/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libSerialDriver.a"
	$(CMAKE_COMMAND) -P CMakeFiles/SerialDriver.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SerialDriver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SerialDriver.dir/build: libSerialDriver.a

.PHONY : CMakeFiles/SerialDriver.dir/build

CMakeFiles/SerialDriver.dir/requires: CMakeFiles/SerialDriver.dir/SerialDriver.cpp.o.requires

.PHONY : CMakeFiles/SerialDriver.dir/requires

CMakeFiles/SerialDriver.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SerialDriver.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SerialDriver.dir/clean

CMakeFiles/SerialDriver.dir/depend:
	cd /home/ajackow/workspace/RedFollow && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow/CMakeFiles/SerialDriver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SerialDriver.dir/depend
