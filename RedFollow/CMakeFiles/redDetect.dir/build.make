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
include CMakeFiles/redDetect.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/redDetect.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/redDetect.dir/flags.make

CMakeFiles/redDetect.dir/redDetect.cpp.o: CMakeFiles/redDetect.dir/flags.make
CMakeFiles/redDetect.dir/redDetect.cpp.o: redDetect.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ajackow/workspace/RedFollow/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/redDetect.dir/redDetect.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/redDetect.dir/redDetect.cpp.o -c /home/ajackow/workspace/RedFollow/redDetect.cpp

CMakeFiles/redDetect.dir/redDetect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/redDetect.dir/redDetect.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ajackow/workspace/RedFollow/redDetect.cpp > CMakeFiles/redDetect.dir/redDetect.cpp.i

CMakeFiles/redDetect.dir/redDetect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/redDetect.dir/redDetect.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ajackow/workspace/RedFollow/redDetect.cpp -o CMakeFiles/redDetect.dir/redDetect.cpp.s

CMakeFiles/redDetect.dir/redDetect.cpp.o.requires:

.PHONY : CMakeFiles/redDetect.dir/redDetect.cpp.o.requires

CMakeFiles/redDetect.dir/redDetect.cpp.o.provides: CMakeFiles/redDetect.dir/redDetect.cpp.o.requires
	$(MAKE) -f CMakeFiles/redDetect.dir/build.make CMakeFiles/redDetect.dir/redDetect.cpp.o.provides.build
.PHONY : CMakeFiles/redDetect.dir/redDetect.cpp.o.provides

CMakeFiles/redDetect.dir/redDetect.cpp.o.provides.build: CMakeFiles/redDetect.dir/redDetect.cpp.o


# Object files for target redDetect
redDetect_OBJECTS = \
"CMakeFiles/redDetect.dir/redDetect.cpp.o"

# External object files for target redDetect
redDetect_EXTERNAL_OBJECTS =

redDetect: CMakeFiles/redDetect.dir/redDetect.cpp.o
redDetect: CMakeFiles/redDetect.dir/build.make
redDetect: libSerialDriver.a
redDetect: /opt/ros/kinetic/lib/libopencv_xphoto3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_xobjdetect3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_tracking3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_surface_matching3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_structured_light3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_stereo3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_saliency3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_rgbd3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_reg3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_plot3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_optflow3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_line_descriptor3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_hdf3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_fuzzy3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_dpm3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_dnn3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_datasets3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_cvv3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_ccalib3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_bioinspired3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_bgsegm3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_aruco3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_viz3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_videostab3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_superres3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_stitching3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_photo3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_text3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_face3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_ximgproc3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_xfeatures2d3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_shape3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_video3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_objdetect3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_calib3d3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_features2d3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_ml3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_highgui3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_videoio3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_imgcodecs3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_imgproc3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_flann3.so.3.1.0
redDetect: /opt/ros/kinetic/lib/libopencv_core3.so.3.1.0
redDetect: CMakeFiles/redDetect.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ajackow/workspace/RedFollow/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable redDetect"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/redDetect.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/redDetect.dir/build: redDetect

.PHONY : CMakeFiles/redDetect.dir/build

CMakeFiles/redDetect.dir/requires: CMakeFiles/redDetect.dir/redDetect.cpp.o.requires

.PHONY : CMakeFiles/redDetect.dir/requires

CMakeFiles/redDetect.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/redDetect.dir/cmake_clean.cmake
.PHONY : CMakeFiles/redDetect.dir/clean

CMakeFiles/redDetect.dir/depend:
	cd /home/ajackow/workspace/RedFollow && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow /home/ajackow/workspace/RedFollow/CMakeFiles/redDetect.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/redDetect.dir/depend

