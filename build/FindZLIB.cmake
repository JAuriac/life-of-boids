

function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS FRAMEWORKS_DIRS)
    if(APPLE)
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${FRAMEWORKS_DIRS} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${FRAMEWORKS_DIRS}")
            endif()
        endforeach()
    endif()
endmacro()


function(conan_package_library_targets libraries package_libdir deps out_libraries out_libraries_target build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            list(APPEND _out_libraries ${CONAN_FOUND_LIBRARY})
            if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
                # Create a micro-target for each lib/a found
                string(REGEX REPLACE "[^A-Za-z0-9.+_-]" "_" _LIBRARY_NAME ${_LIBRARY_NAME})
                set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
                if(NOT TARGET ${_LIB_NAME})
                    # Create a micro-target for each lib/a found
                    add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                    set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
                    set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
                else()
                    conan_message(STATUS "Skipping already existing target: ${_LIB_NAME}")
                endif()
                list(APPEND _out_libraries_target ${_LIB_NAME})
            endif()
            conan_message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            list(APPEND _out_libraries_target ${_LIBRARY_NAME})
            list(APPEND _out_libraries ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
        # Add all dependencies to all targets
        string(REPLACE " " ";" deps_list "${deps}")
        foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
            set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
        endforeach()
    endif()

    set(${out_libraries} ${_out_libraries} PARENT_SCOPE)
    set(${out_libraries_target} ${_out_libraries_target} PARENT_SCOPE)
endfunction()


include(FindPackageHandleStandardArgs)

conan_message(STATUS "Conan: Using autogenerated FindZLIB.cmake")
# Global approach
set(ZLIB_FOUND 1)
set(ZLIB_VERSION "1.2.11")

find_package_handle_standard_args(ZLIB REQUIRED_VARS
                                  ZLIB_VERSION VERSION_VAR ZLIB_VERSION)
mark_as_advanced(ZLIB_FOUND ZLIB_VERSION)


set(ZLIB_INCLUDE_DIRS "/home/conan/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(ZLIB_INCLUDE_DIR "/home/conan/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(ZLIB_INCLUDES "/home/conan/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(ZLIB_RES_DIRS )
set(ZLIB_DEFINITIONS )
set(ZLIB_LINKER_FLAGS_LIST
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:>"
        "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:>"
)
set(ZLIB_COMPILE_DEFINITIONS )
set(ZLIB_COMPILE_OPTIONS_LIST "" "")
set(ZLIB_COMPILE_OPTIONS_C "")
set(ZLIB_COMPILE_OPTIONS_CXX "")
set(ZLIB_LIBRARIES_TARGETS "") # Will be filled later, if CMake 3
set(ZLIB_LIBRARIES "") # Will be filled later
set(ZLIB_LIBS "") # Same as ZLIB_LIBRARIES
set(ZLIB_SYSTEM_LIBS )
set(ZLIB_FRAMEWORK_DIRS )
set(ZLIB_FRAMEWORKS )
set(ZLIB_FRAMEWORKS_FOUND "") # Will be filled later
set(ZLIB_BUILD_MODULES_PATHS )

conan_find_apple_frameworks(ZLIB_FRAMEWORKS_FOUND "${ZLIB_FRAMEWORKS}" "${ZLIB_FRAMEWORK_DIRS}")

mark_as_advanced(ZLIB_INCLUDE_DIRS
                 ZLIB_INCLUDE_DIR
                 ZLIB_INCLUDES
                 ZLIB_DEFINITIONS
                 ZLIB_LINKER_FLAGS_LIST
                 ZLIB_COMPILE_DEFINITIONS
                 ZLIB_COMPILE_OPTIONS_LIST
                 ZLIB_LIBRARIES
                 ZLIB_LIBS
                 ZLIB_LIBRARIES_TARGETS)

# Find the real .lib/.a and add them to ZLIB_LIBS and ZLIB_LIBRARY_LIST
set(ZLIB_LIBRARY_LIST z)
set(ZLIB_LIB_DIRS "/home/conan/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")

# Gather all the libraries that should be linked to the targets (do not touch existing variables):
set(_ZLIB_DEPENDENCIES "${ZLIB_FRAMEWORKS_FOUND} ${ZLIB_SYSTEM_LIBS} ")

conan_package_library_targets("${ZLIB_LIBRARY_LIST}"  # libraries
                              "${ZLIB_LIB_DIRS}"      # package_libdir
                              "${_ZLIB_DEPENDENCIES}"  # deps
                              ZLIB_LIBRARIES            # out_libraries
                              ZLIB_LIBRARIES_TARGETS    # out_libraries_targets
                              ""                          # build_type
                              "ZLIB")                                      # package_name

set(ZLIB_LIBS ${ZLIB_LIBRARIES})

foreach(_FRAMEWORK ${ZLIB_FRAMEWORKS_FOUND})
    list(APPEND ZLIB_LIBRARIES_TARGETS ${_FRAMEWORK})
    list(APPEND ZLIB_LIBRARIES ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${ZLIB_SYSTEM_LIBS})
    list(APPEND ZLIB_LIBRARIES_TARGETS ${_SYSTEM_LIB})
    list(APPEND ZLIB_LIBRARIES ${_SYSTEM_LIB})
endforeach()

# We need to add our requirements too
set(ZLIB_LIBRARIES_TARGETS "${ZLIB_LIBRARIES_TARGETS};")
set(ZLIB_LIBRARIES "${ZLIB_LIBRARIES};")

set(CMAKE_MODULE_PATH "/home/conan/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/home/conan/.conan/data/zlib/1.2.11/_/_/package/6af9cc7cb931c5ad942174fd7838eb655717c709/" ${CMAKE_PREFIX_PATH})

if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
    # Target approach
    if(NOT TARGET ZLIB::ZLIB)
        add_library(ZLIB::ZLIB INTERFACE IMPORTED)
        if(ZLIB_INCLUDE_DIRS)
            set_target_properties(ZLIB::ZLIB PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                                  "${ZLIB_INCLUDE_DIRS}")
        endif()
        set_property(TARGET ZLIB::ZLIB PROPERTY INTERFACE_LINK_LIBRARIES
                     "${ZLIB_LIBRARIES_TARGETS};${ZLIB_LINKER_FLAGS_LIST}")
        set_property(TARGET ZLIB::ZLIB PROPERTY INTERFACE_COMPILE_DEFINITIONS
                     ${ZLIB_COMPILE_DEFINITIONS})
        set_property(TARGET ZLIB::ZLIB PROPERTY INTERFACE_COMPILE_OPTIONS
                     "${ZLIB_COMPILE_OPTIONS_LIST}")
        
    endif()
endif()

foreach(_BUILD_MODULE_PATH ${ZLIB_BUILD_MODULES_PATHS})
    include(${_BUILD_MODULE_PATH})
endforeach()
