set dotenv-load

# List available recipes
[default]
_:
    @just --list

# Install the toolchain and dependencies, then fetch and bootstrap vcpkg
init:
    ./scripts/init.sh

# Run vcpkg, e.g. `just vcpkg search fmt`
[positional-arguments]
vcpkg *args:
    ./vcpkg/vcpkg "$@"

# Configure with CMake
config:
    cmake \
        -B "$BUILD_DIR" \
        -G Ninja -DCMAKE_BUILD_TYPE="$CMAKE_BUILD_TYPE" \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DCMAKE_CXX_STANDARD=26 \
        -DCMAKE_CXX_STANDARD_REQUIRED=ON

# Build the project
build: config
    cmake --build "$BUILD_DIR" --parallel

# Run tests
test: build
    ctest --test-dir "$BUILD_DIR"/test

# Remove the build directory
clean:
    rm -rf "$BUILD_DIR"
