# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/build

# Include any dependencies generated for this target.
include src/CMakeFiles/libGLX.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/libGLX.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/libGLX.dir/flags.make

src/CMakeFiles/libGLX.dir/glx.cpp.o: src/CMakeFiles/libGLX.dir/flags.make
src/CMakeFiles/libGLX.dir/glx.cpp.o: ../src/glx.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/libGLX.dir/glx.cpp.o"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libGLX.dir/glx.cpp.o -c /data/src/glx.cpp

src/CMakeFiles/libGLX.dir/glx.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libGLX.dir/glx.cpp.i"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/src/glx.cpp > CMakeFiles/libGLX.dir/glx.cpp.i

src/CMakeFiles/libGLX.dir/glx.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libGLX.dir/glx.cpp.s"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/src/glx.cpp -o CMakeFiles/libGLX.dir/glx.cpp.s

src/CMakeFiles/libGLX.dir/resources/Bird.cpp.o: src/CMakeFiles/libGLX.dir/flags.make
src/CMakeFiles/libGLX.dir/resources/Bird.cpp.o: ../src/resources/Bird.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/libGLX.dir/resources/Bird.cpp.o"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libGLX.dir/resources/Bird.cpp.o -c /data/src/resources/Bird.cpp

src/CMakeFiles/libGLX.dir/resources/Bird.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libGLX.dir/resources/Bird.cpp.i"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/src/resources/Bird.cpp > CMakeFiles/libGLX.dir/resources/Bird.cpp.i

src/CMakeFiles/libGLX.dir/resources/Bird.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libGLX.dir/resources/Bird.cpp.s"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/src/resources/Bird.cpp -o CMakeFiles/libGLX.dir/resources/Bird.cpp.s

src/CMakeFiles/libGLX.dir/resources/Flock.cpp.o: src/CMakeFiles/libGLX.dir/flags.make
src/CMakeFiles/libGLX.dir/resources/Flock.cpp.o: ../src/resources/Flock.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/libGLX.dir/resources/Flock.cpp.o"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/libGLX.dir/resources/Flock.cpp.o -c /data/src/resources/Flock.cpp

src/CMakeFiles/libGLX.dir/resources/Flock.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/libGLX.dir/resources/Flock.cpp.i"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/src/resources/Flock.cpp > CMakeFiles/libGLX.dir/resources/Flock.cpp.i

src/CMakeFiles/libGLX.dir/resources/Flock.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/libGLX.dir/resources/Flock.cpp.s"
	cd /data/build/src && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/src/resources/Flock.cpp -o CMakeFiles/libGLX.dir/resources/Flock.cpp.s

# Object files for target libGLX
libGLX_OBJECTS = \
"CMakeFiles/libGLX.dir/glx.cpp.o" \
"CMakeFiles/libGLX.dir/resources/Bird.cpp.o" \
"CMakeFiles/libGLX.dir/resources/Flock.cpp.o"

# External object files for target libGLX
libGLX_EXTERNAL_OBJECTS =

src/liblibGLX.a: src/CMakeFiles/libGLX.dir/glx.cpp.o
src/liblibGLX.a: src/CMakeFiles/libGLX.dir/resources/Bird.cpp.o
src/liblibGLX.a: src/CMakeFiles/libGLX.dir/resources/Flock.cpp.o
src/liblibGLX.a: src/CMakeFiles/libGLX.dir/build.make
src/liblibGLX.a: src/CMakeFiles/libGLX.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library liblibGLX.a"
	cd /data/build/src && $(CMAKE_COMMAND) -P CMakeFiles/libGLX.dir/cmake_clean_target.cmake
	cd /data/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libGLX.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/libGLX.dir/build: src/liblibGLX.a

.PHONY : src/CMakeFiles/libGLX.dir/build

src/CMakeFiles/libGLX.dir/clean:
	cd /data/build/src && $(CMAKE_COMMAND) -P CMakeFiles/libGLX.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/libGLX.dir/clean

src/CMakeFiles/libGLX.dir/depend:
	cd /data/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data /data/src /data/build /data/build/src /data/build/src/CMakeFiles/libGLX.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/libGLX.dir/depend

