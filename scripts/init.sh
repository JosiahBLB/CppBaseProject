#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

# gum is needed for the output below, so install it first with plain echo
if ! command -v gum >/dev/null; then
    if command -v go >/dev/null; then
        echo "Installing gum (go install)"
        go install github.com/charmbracelet/gum@latest
        export PATH="$(go env GOPATH)/bin:$PATH"
    else
        echo "Installing gum (apt)"
        sudo mkdir -p /etc/apt/keyrings
        wget -qO- https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
        echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list >/dev/null
        sudo apt update && sudo apt install -y gum
    fi
fi

# Prompt for the sudo password once, before any spinner hides the prompt
sudo_ready=false
need_sudo() {
    if [ "$sudo_ready" = false ]; then
        gum log --level info "Some steps need sudo"
        sudo -v
        sudo_ready=true
    fi
}

# Run a command behind a spinner, showing its output only if it fails
step() {
    local title=$1
    shift
    gum spin --spinner dot --title "$title" --show-error -- "$@"
    gum style --foreground 2 "✓ $title"
}

skip() {
    gum style --faint "• $1"
}

gum style --border rounded --border-foreground 212 --padding "0 2" --bold "CppBaseProject init"

if [ ! -f .env ]; then
    step "Copying .env.sample to .env" cp .env.sample .env
else
    skip ".env already exists"
fi

if ! command -v clang-21 >/dev/null; then
    need_sudo
    step "Installing llvm compiler (clang-21)" sudo bash -c "$(wget -qO- https://apt.llvm.org/llvm.sh)" -- 21
else
    skip "clang-21 already installed"
fi

if ! dpkg -s libc++-21-dev libc++abi-21-dev &>/dev/null; then
    need_sudo
    step "Installing the clang ABI and standard library for clang-21" sudo apt install -y libc++-21-dev libc++abi-21-dev
else
    skip "libc++-21 already installed"
fi

if ! command -v lldb-21 >/dev/null; then
    need_sudo
    step "Installing llvm debugger (lldb-21)" sudo apt install -y lldb-21
else
    skip "lldb-21 already installed"
fi

if ! command -v cmake >/dev/null || ! command -v ninja >/dev/null; then
    need_sudo
    step "Installing build system and generator" sudo apt install -y cmake ninja-build
else
    skip "cmake and ninja already installed"
fi

if ! command -v code >/dev/null; then
    need_sudo
    step "Installing vscode" sudo snap install code --classic
else
    skip "vscode already installed"
fi

for extension in ms-vscode.cmake-tools matepek.vscode-catch2-test-adapter; do
    if ! code --list-extensions | grep -qix "$extension"; then
        step "Installing vscode extension ($extension)" code --install-extension "$extension"
    else
        skip "vscode extension $extension already installed"
    fi
done

if [ ! -f vcpkg/bootstrap-vcpkg.sh ]; then
    step "Fetching vcpkg" git submodule update --init --recursive
else
    skip "vcpkg already fetched"
fi

if [ ! -x vcpkg/vcpkg ]; then
    step "Bootstrapping vcpkg" ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
else
    skip "vcpkg already bootstrapped"
fi

echo
gum style --foreground 212 --bold "All set! Next: just build && just test"
