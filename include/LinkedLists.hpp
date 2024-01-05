#include <memory>

struct Node {
  int value;
  std::shared_ptr<Node> next;
  std::shared_ptr<Node> prev;
};

class DoublyLinkedList {
  std::shared_ptr<Node> m_head;

public:
  DoublyLinkedList() = default;
  DoublyLinkedList(const DoublyLinkedList &) = delete;
  DoublyLinkedList(DoublyLinkedList &&) = delete;
  auto operator=(const DoublyLinkedList &) -> DoublyLinkedList & = delete;
  auto operator=(DoublyLinkedList &&) -> DoublyLinkedList & = delete;
  ~DoublyLinkedList() = default;
  auto doubly_linked_list_example() -> void; // done
  auto insert(int val, int idx) -> void;     // done
  auto remove(int idx) -> void;              // done
  auto get_head() -> std::shared_ptr<Node>;  // done
  auto get_tail() -> std::shared_ptr<Node>;  // done
  auto print_iterative() -> void;
  auto print_recursive(std::shared_ptr<Node> &node) -> void;         // done
  auto print_reverse_recursive(std::shared_ptr<Node> &node) -> void; // done
  auto reverse_iterative() -> Node;
  auto reverse_recursive(std::shared_ptr<Node> &node) -> void;
};
