# This directory is a space for all of your tests You may want to make
# subdirectories for the different types i.e: unit, integration, etc.

enable_testing()

add_executable(example_test example_test.cpp)

find_package(Catch2 3 CONFIG REQUIRED)
target_link_libraries(example_test PRIVATE Catch2::Catch2WithMain)

include(Catch)
catch_discover_tests(example_test)
