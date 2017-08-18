# Animal Shelter

### OUTLINE ####
# Main Queue
    # Doubly-Linked List, due to need for accessing non-first elements

# Species Queues
    # Normal queues
#######################

## Basic Class Definitions
# Linked List node class
class DoublyLinkedListNode(object):
    def __init__(self, value=None):
        if value is None:
            self.value = "HEAD"
        else:
            self.value = value
        self.prev = None
        self.next = None

    def __str__(self):
        return value

# Linked List class
class DoublyLinkedList(object):
    def __init__(self):
        self.head = DoublyLinkedListNode()
        self.tail = self.head

    def add(self, value):
        newNode = DoublyLinkedListNode(value)
        self.tail.next = newNode
        newNode.prev = self.tail
        self.tail = newNode

    def remove(self, node):
        node.next.prev = node.prev
        node.prev.next = node.next
        node.next = None
        node.prev = None
        return node

    def take(self):
        node = self.head.next
        self.remove(node)
        return node

    def __str__(self):
        currentNode = self.head
        result = ""
        result += currentNode.value
        result += "\n"
        while currentNode.next is not None:
            currentNode = currentNode.next
            result += currentNode.value
            result += "\n"
        return result


# Stack class

# Queue class


## Shelter Classes
# ShelterQueue

# AnimalNode

x = DoublyLinkedList()
x.add("test")
x.add("more stuff")

print x

x.take()

print x
