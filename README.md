# Cpp Template
This serves as a template for any cpp project, majority of this code was taken from Prateek Raman's repository.
His talk and repository can be found below:

- Repositoy: https://github.com/vvnraman/cppcon-2022-cpp-neovim-toy-calc
- CppCon talk: https://www.youtube.com/watch?v=nzRnWUjGJl8

## Getting Started
There are a number of things you need to do before you can start using this template:
1. Download the dependencies with your chosen package manager (apt, brew, etc): gcc, cmake, ninja and invoke (pip)
    ```sh
    apt install gcc
    apt install cmake
    apt install ninja
    python -m pip install invoke
    ```
2. Initialise and install vcpkg
    ```sh
    git submodule update --init
    ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
    ```
3. Add the required c++ libraries to your vcpkg.json file i.e:
    ```json
    {
      "dependencies": [
        "opengl",
        "something-else"
      ]
    }
    ```
4. Run `./vcpkg/vcpkg install` to install the c++ libraries
5. Configure Each CMakeLists.txt (See files for more instructions)
6. Define your `project-name` in the tasks.py file
7. Run `invoke config build`
8. Tell Josiah he's a good bugger
