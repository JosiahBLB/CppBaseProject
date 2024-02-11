# Cpp Template

This serves as a template for any cpp projects, majority of this code was taken from Prateek Raman's repository.
His talk and repository can be found below:

- Repositoy: https://github.com/vvnraman/cppcon-2022-cpp-neovim-toy-calc
- CppCon talk: https://www.youtube.com/watch?v=nzRnWUjGJl8

## Getting Started

There are a number of things you need to do before you can start using this template:

1. Download the dependencies with your chosen package manager (apt, brew, etc): clang, cmake, ninja and invoke (pip)

```sh
apt install clang
apt install cmake
apt install ninja
```

3. Define your `project-name` in the tasks.py file
4. run

```sh
git submodule update --init --recursive
./vcpkg/bootstrap-vcpkg.sh -disableMetrics

```

5. Add the required c++ libraries to your vcpkg.json i,e:

```json
{
  "dependencies": ["opengl", "something-else"]
}
```

To search for a library use `./vcpkg/vcpkg search <package-name>`

6. Run `./vcpkg/vcpkg install`
7. Configure Each CMakeLists.txt (See files for more instructions)
8. Run

```sh
cmake -G Ninja -B build
ninja -C build
```

9. Tell Josiah he's a good bugger
