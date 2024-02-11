cmake_minimum_required(VERSION 3.5)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

# Replace 'my-project' with your project name:
project(my-project CXX)

enable_testing()

# Standard directory structure:
add_subdirectory(include)
add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(test)
# some others you may want to add is scripts, doc
