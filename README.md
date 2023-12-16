# Cpp Template
This serves as a template for any cpp projects, majority of this code was taken from Prateek Raman's repository.
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
3. Define your `project-name` in the tasks.py file
4. Add the required c++ libraries to your vcpkg.json i,e:
```json
{
  "dependencies": [
    "opengl",
    "something-else"
  ]
}
```
5. Run `./vcpkg/vcpkg install`
6. Configure Each CMakeLists.txt (See files for more instructions)
7. Run `invoke config build`
8. Tell Josiah he's a good bugger
