# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build

# Include any dependencies generated for this target.
include CMakeFiles/hello_dlt.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hello_dlt.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello_dlt.dir/flags.make

CMakeFiles/hello_dlt.dir/hello_dlt.cpp.o: CMakeFiles/hello_dlt.dir/flags.make
CMakeFiles/hello_dlt.dir/hello_dlt.cpp.o: ../hello_dlt.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/hello_dlt.dir/hello_dlt.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hello_dlt.dir/hello_dlt.cpp.o -c /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/hello_dlt.cpp

CMakeFiles/hello_dlt.dir/hello_dlt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hello_dlt.dir/hello_dlt.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/hello_dlt.cpp > CMakeFiles/hello_dlt.dir/hello_dlt.cpp.i

CMakeFiles/hello_dlt.dir/hello_dlt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hello_dlt.dir/hello_dlt.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/hello_dlt.cpp -o CMakeFiles/hello_dlt.dir/hello_dlt.cpp.s

# Object files for target hello_dlt
hello_dlt_OBJECTS = \
"CMakeFiles/hello_dlt.dir/hello_dlt.cpp.o"

# External object files for target hello_dlt
hello_dlt_EXTERNAL_OBJECTS =

hello_dlt: CMakeFiles/hello_dlt.dir/hello_dlt.cpp.o
hello_dlt: CMakeFiles/hello_dlt.dir/build.make
hello_dlt: CMakeFiles/hello_dlt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hello_dlt"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello_dlt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello_dlt.dir/build: hello_dlt

.PHONY : CMakeFiles/hello_dlt.dir/build

CMakeFiles/hello_dlt.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello_dlt.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello_dlt.dir/clean

CMakeFiles/hello_dlt.dir/depend:
	cd /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build /home/lum3hc/work/ctf/dlt-daemon_folk_demo/hello_dlt/build/CMakeFiles/hello_dlt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello_dlt.dir/depend
