# Cpp Template

This serves as a template for any cpp projects, some of this code was taken from Prateek Raman's repository.
His talk and repository can be found below:

- Repositoy: https://github.com/vvnraman/cppcon-2022-cpp-neovim-toy-calc
- CppCon talk: https://www.youtube.com/watch?v=nzRnWUjGJl8

## Getting Started

There are a number of things you need to do before you can start using this template:

1. Download the following dependencies with your chosen package manager, I am using `brew` but you may use `apt`:

```sh
brew install clang
brew install cmake
brew install ninja
brew install lsd
python -m pip install invoke
```

3. Complete the TODO's in both the tasks.py and the top level CMakeLists.txt files.
4. run

```sh
git submodule update --init --recursive
./vcpkg/bootstrap-vcpkg.sh -disableMetrics

```

5. Search for a c++ library use `./vcpkg/vcpkg search <package-name>` and add it to your vcpkg.json i,e:

```json
{
  "dependencies": ["gtest", "package2", "package3"]
}
```

6. Run `./vcpkg/vcpkg install`, this will instruct you to add a few lines of code in your CMakeLists.txt files of which I have added some instructions to help you with this in each file.
7. Run

```sh
inv config
inv build
inv test
```

9. Tell Josiah he's a good bugger
