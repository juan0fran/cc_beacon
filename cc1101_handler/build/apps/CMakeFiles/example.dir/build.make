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
CMAKE_COMMAND = /opt/local/bin/cmake

# The command to remove a file.
RM = /opt/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/juan0fran/Desktop/cc_beacon/cc1101_handler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build

# Include any dependencies generated for this target.
include apps/CMakeFiles/example.dir/depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/example.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/example.dir/flags.make

apps/CMakeFiles/example.dir/example.c.o: apps/CMakeFiles/example.dir/flags.make
apps/CMakeFiles/example.dir/example.c.o: ../apps/example.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/CMakeFiles/example.dir/example.c.o"
	cd /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/example.dir/example.c.o   -c /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/apps/example.c

apps/CMakeFiles/example.dir/example.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example.dir/example.c.i"
	cd /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/apps/example.c > CMakeFiles/example.dir/example.c.i

apps/CMakeFiles/example.dir/example.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example.dir/example.c.s"
	cd /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/apps/example.c -o CMakeFiles/example.dir/example.c.s

apps/CMakeFiles/example.dir/example.c.o.requires:

.PHONY : apps/CMakeFiles/example.dir/example.c.o.requires

apps/CMakeFiles/example.dir/example.c.o.provides: apps/CMakeFiles/example.dir/example.c.o.requires
	$(MAKE) -f apps/CMakeFiles/example.dir/build.make apps/CMakeFiles/example.dir/example.c.o.provides.build
.PHONY : apps/CMakeFiles/example.dir/example.c.o.provides

apps/CMakeFiles/example.dir/example.c.o.provides.build: apps/CMakeFiles/example.dir/example.c.o


# Object files for target example
example_OBJECTS = \
"CMakeFiles/example.dir/example.c.o"

# External object files for target example
example_EXTERNAL_OBJECTS =

../bin/example: apps/CMakeFiles/example.dir/example.c.o
../bin/example: apps/CMakeFiles/example.dir/build.make
../bin/example: ../lib/libcc_beacon_iface.0.1.dylib
../bin/example: apps/CMakeFiles/example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../bin/example"
	cd /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/example.dir/build: ../bin/example

.PHONY : apps/CMakeFiles/example.dir/build

apps/CMakeFiles/example.dir/requires: apps/CMakeFiles/example.dir/example.c.o.requires

.PHONY : apps/CMakeFiles/example.dir/requires

apps/CMakeFiles/example.dir/clean:
	cd /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/example.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/example.dir/clean

apps/CMakeFiles/example.dir/depend:
	cd /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/juan0fran/Desktop/cc_beacon/cc1101_handler /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/apps /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps /Users/juan0fran/Desktop/cc_beacon/cc1101_handler/build/apps/CMakeFiles/example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/example.dir/depend

