## Getting Started

There are a number of things you need to do before you can start using this template:

1. Complete the TODO's in the top level CMakeLists.txt file.

2. run

```sh
just init
```

3. Search for a c++ library use `just vcpkg search <package-name>` and add it to your vcpkg.json i,e:

```json
{
  "dependencies": ["catch2", "package2", "package3"]
}
```

4. Run `just vcpkg install`, this will instruct you to add a few lines of code in your CMakeLists.txt files of which I have added some instructions to help you with this in each file.

6. Run

```sh
just build
just test
```

7. Tell Josiah he's a good bugger
