# This directory is a space for all of your main code

add_executable(main main.cpp)
# add your packages, you should see examples when you run './vcpkg/vcpkg install'

# Some exmaples:

# find_package(OpenGL REQUIRED)
# target_link_libraries(main PRIVATE OpenGL::GL)
#
# find_package(glfw3 CONFIG REQUIRED)
# target_link_libraries(main PRIVATE glfw)

install(TARGETS main)
