# This directory is a space for all of your tests You may want to make
# subdirectories for the different types i.e: unit, integration, etc.

enable_testing()

add_executable(example_test example_test.cpp)

find_package(GTest CONFIG REQUIRED)
target_link_libraries(example_test PRIVATE GTest::gtest GTest::gtest_main
                                           GTest::gmock GTest::gmock_main)

include(GoogleTest)
gtest_discover_tests(example_test)
