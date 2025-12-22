cmake_minimum_required(VERSION 3.25)

if(${CMAKE_VERSION} VERSION_LESS 3.12)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

set(CMAKE_TOOLCHAIN_FILE
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
    CACHE STRING "" FORCE)
set(VCPKG_TARGET_TRIPLET
    "x64-linux-clang-21"
    CACHE STRING "" FORCE)
set(VCPKG_OVERLAY_TRIPLETS "${CMAKE_SOURCE_DIR}/triplets")

# BUG: Determine why these aren't loaded by the toolchain
set(CMAKE_C_COMPILER "clang-21")
set(CMAKE_CXX_COMPILER "clang++-21")

# TODO: Replace 'my-project' with your project name:
project(my-project CXX)

# Ensure libc++ for everything
add_compile_options(-stdlib=libc++)
add_link_options(-stdlib=libc++ -lc++abi -lpthread)

add_subdirectory(include)
add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(test)
# TODO: (optional) add other directories such as scripts, doc, etc.
