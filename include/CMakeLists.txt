# This directory is a space for your header files
link_libraries(
  dsa-libraries
  LinkedLists.hpp
)

target_link_libraries(main PRIVATE dsa-libraries)

# Leave blank if unused
