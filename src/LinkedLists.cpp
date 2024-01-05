#include "LinkedLists.hpp"
#include <iostream>
#include <memory>
#include <string>

auto print_info(const std::string &message) {
  std::cout << "\033[31m" << message << "\033[0m"
            << "\n";
}

auto DoublyLinkedList::doubly_linked_list_example() -> void {
  this->insert(50, 0);
  this->insert(60, 1);
  this->insert(69, 2);
  this->insert(80, 3);
  this->insert(90, 4);

  print_info("\nPrint all nodes using recursion:");
  this->print_recursive(this->m_head);

  print_info("\nPrint all nodes in reverse using recursion:");
  this->print_reverse_recursive(this->m_head);

  print_info("\nRemoving the node at the index 2 with value 69:");
  this->remove(2);
  this->print_recursive(this->m_head);

  print_info("\nAdding back a node at the same index:");
  this->insert(70, 2);
  this->print_recursive(this->m_head);

  print_info("\nReversing the list using recursion:");
  this->reverse_recursive(this->m_head);
  this->print_recursive(this->m_head);
}

auto DoublyLinkedList::get_head() -> std::shared_ptr<Node> { return this->m_head; }

auto DoublyLinkedList::get_tail() -> std::shared_ptr<Node> {
  auto temp = this->m_head;
  while (temp->next != nullptr) {
    temp = temp->next;
  }
  return temp;
}

auto DoublyLinkedList::insert(int val, int idx) -> void {
  auto new_node = std::make_shared<Node>();
  new_node->value = val;

  // Special case if the chosen index is zero
  if (idx == 0) {
    new_node->prev = nullptr;
    new_node->next = this->m_head;
    this->m_head = new_node;
    return;
  }

  // Traverse the linked list to one node before the chosen node
  auto temp = this->m_head;
  for (int i = 0; i < idx - 1; i++) {
    temp = temp->next;
  }

  // Complete the insertion
  new_node->next = temp->next;
  temp->next = new_node;
  new_node->prev = temp;
}

auto DoublyLinkedList::remove(int idx) -> void {
  // Special case where chosen index is zero
  if (idx == 0) {
    this->m_head = m_head->next;
    this->m_head->prev = nullptr;
    return;
  }

  // Traverse the linked list to the chosen node
  auto temp = this->m_head;
  for (int i = 0; i < idx; i++) { // false when i == idx
    temp = temp->next;
  }

  // Update the links and delete the node
  temp->prev->next = temp->next;
  temp->next->prev = temp->prev;
  temp.reset();
  std::cout << "Active links to the deleted pointer: " << temp.use_count()
            << "\n";
}

auto DoublyLinkedList::print_recursive(std::shared_ptr<Node> &node) -> void {
  // Exit case for recursive call
  if (node->next == nullptr) {
    std::cout << node->value << "\n";
    return;
  }

  // Print the current node's value and recall print_recursive on the next node
  std::cout << node->value << " -> ";
  DoublyLinkedList::print_recursive(node->next);
}

auto DoublyLinkedList::print_reverse_recursive(std::shared_ptr<Node> &node) -> void {
  // Exit case for recursive call
  if (node->next == nullptr) {
    std::cout << node->value << " -> ";
    return;
  }

  // Traverse the linked list, and then print each element as it is popped off
  // the stack.
  DoublyLinkedList::print_reverse_recursive(node->next);
  std::cout << node->value << (node->prev != nullptr ? " -> " : "\n");
}

auto DoublyLinkedList::reverse_recursive(std::shared_ptr<Node> &node) -> void {
  // If at the last node then assign it to head and exit recursion
  if (node->next == nullptr) {
    node->next = node->prev;
    node->prev = nullptr;
    this->m_head = node;
    return;
  }

  print_info(std::format("Old references:\nValue: {}\nNext: {}\nPrev: {}",
                         node->value, node->next, node->prev));

  // Reverse the references
  auto temp = node->next;
  node->next = node->prev;
  node->prev = temp;
  DoublyLinkedList::reverse_recursive(node->prev);
}
