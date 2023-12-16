cmake_minimum_required(VERSION 3.7...3.27)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
    cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

# Replace 'my-project' with your project name:
project(my-project CXX)

# Message from Prateek:
# DO NOT DO THIS IN YOUR CMakeLists.txt. THIS SHOULD BE SET IN YOUR TOOLCHAIN
# FILE. THIS DEMO PROJECT IS PRIMARILY FOR NEOVIM DEMO HENCE THIS IS NON CMAKE
# DEMOWARE AND HENCE JUSTIFIED.
set(CMAKE_CXX_STANDARD 20 CACHE STRING "C++ standard to be used")

enable_testing()

add_subdirectory(include)
add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(test)
