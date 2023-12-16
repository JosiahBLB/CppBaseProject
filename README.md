# Cpp Template
This serves as a template for any cpp projects, majority of this code was taken from Prateek Raman's repository.
His talk and repository can be found below:

- Repositoy: https://github.com/vvnraman/cppcon-2022-cpp-neovim-toy-calc
- CppCon talk: https://www.youtube.com/watch?v=nzRnWUjGJl8

## Getting Started
There are a number of things you need to do before you can start using this template:
1. Download the dependencies with your chosen package manager (apt, brew, etc): gcc, cmake, ninja and invoke (pip)
2. Define your <project-name> in the tasks.py file
3. Add the required libraries to your vcpkg.json
4. Run `./vcpkg/vcpkg install`
5. Configure Each CMakeLists.txt (See files for more instructions)
6. Run `invoke config build`
7. Tell Josiah he's a good bugger
