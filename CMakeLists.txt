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

# Project name comes from PROJECT_NAME in the environment, falling back to .env
# so configuring outside of `just` (e.g. vscode cmake tools) still works
if(DEFINED ENV{PROJECT_NAME})
  set(name "$ENV{PROJECT_NAME}")
elseif(EXISTS "${CMAKE_CURRENT_LIST_DIR}/.env")
  set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_LIST_DIR}/.env")
  file(STRINGS "${CMAKE_CURRENT_LIST_DIR}/.env" name
    REGEX "^PROJECT_NAME=" LIMIT_COUNT 1)
  string(REGEX REPLACE "^PROJECT_NAME=" "" name "${name}")
endif()
if(NOT name)
  message(FATAL_ERROR "PROJECT_NAME is not set, add it to .env (see .env.sample)")
endif()

project("${name}" CXX)

# Ensure libc++ for everything
add_compile_options(-stdlib=libc++)
add_link_options(-stdlib=libc++ -lc++abi -lpthread)

add_subdirectory(include)
add_subdirectory(lib)
add_subdirectory(src)
add_subdirectory(test)
