#include <catch2/catch_test_macros.hpp>

#include <string_view>

// Demonstrate some basic assertions.
TEST_CASE("Basic assertions", "[hello]") {
    // Expect two strings not to be equal.
    CHECK(std::string_view{"hello"} != std::string_view{"world"});
    // Expect equality.
    CHECK(7 * 6 == 42);
}
