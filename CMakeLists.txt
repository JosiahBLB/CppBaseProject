cmake_minimum_required(VERSION 3.7...3.27)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_C_COMPILER /usr/local/bin/gcc-13)
set(CMAKE_CXX_COMPILER /usr/local/bin/g++-13)
set(CXX "${CMAKE_CXX_COMPILER}")

# Replace 'my-project' with your project name::
project(my-project CXX)

# Message from Prateek:
# DO NOT DO THIS IN YOUR CMakeLists.txt. THIS SHOULD BE SET IN YOUR TOOLCHAIN
# FILE. THIS DEMO PROJECT IS PRIMARILY FOR NEOVIM DEMO HENCE THIS IS NON CMAKE
# DEMOWARE AND HENCE JUSTIFIED.

execute_process(COMMAND which gcc OUTPUT_VARIABLE GCC_PATH)
string(STRIP ${GCC_PATH} GCC_PATH)
message(STATUS "GCC_EXE=${GCC_PATH}")
message(STATUS ${CXX})

set(CMAKE_CXX_STANDARD 20 CACHE STRING "C++ standard to be used")
set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_testing()

include_directories(include)
add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(test)
