#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

if ! command -v clang-21 >/dev/null; then
    echo "Installing llvm compiler (clang-21)"
    sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" -- 21
fi

if ! dpkg -s libc++-21-dev libc++abi-21-dev &>/dev/null; then
    echo "Installing the clang ABI and standard library for clang-21"
    sudo apt install -y libc++-21-dev libc++abi-21-dev
fi

if ! command -v lldb-21 >/dev/null; then
    echo "Installing llvm debugger (lldb-21)"
    sudo apt install lldb-21
fi

if ! command -v cmake >/dev/null || ! command -v ninja >/dev/null; then
    echo "Installing build system and generator"
    sudo apt install cmake ninja-build
fi

if ! command -v code >/dev/null; then
    echo "Installing vscode"
    sudo snap install code --classic
fi

for extension in ms-vscode.cmake-tools matepek.vscode-catch2-test-adapter; do
    if ! code --list-extensions | grep -qix "$extension"; then
        echo "Installing vscode extension ($extension)"
        code --install-extension "$extension"
    fi
done

if [ ! -f vcpkg/bootstrap-vcpkg.sh ]; then
    echo "Fetching vcpkg"
    git submodule update --init --recursive
fi

if [ ! -x vcpkg/vcpkg ]; then
    echo "Bootstrapping vcpkg"
    ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
fi
