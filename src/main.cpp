#include "LinkedLists.hpp"
#include <memory>

auto main(int /*argc*/, char * /*argv*/[]) -> int {
  auto linked_list = std::make_shared<DoublyLinkedList>();
  linked_list->doubly_linked_list_example();
  return 0;
}
