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

    def add(self, node):
        self.tail.next = node
        node.prev = self.tail
        self.tail = node

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
class Stack(object):
    # A basic stack
    def __init__(self):
        self.stack = []

    def add(self, element):
        self.stack.append(element)
        return element

    def take(self):
        return self.stack.pop()

    def peek(self):
        return self.stack[-1]

    def isEmpty(self):
        return not self.stack

    def __str__(self):
        return self.stack.__str__()

# Queue class
class Queue(object):
    def __init__(self):
        self.inbox = Stack()
        self.outbox = Stack()

    def enqueue(self, element):
        self.inbox.add(element)
        return element

    def dequeue(self):
        if self.outbox.isEmpty():
            self.flipStacks()
        return self.outbox.take()

    def flipStacks(self):
        while not self.inbox.isEmpty():
            self.outbox.add(self.inbox.take())
        return True

    def __str__(self):
        return "In: " + self.inbox.__str__() + "\nOut: " + self.outbox.__str__()



## Shelter Classes
# AnimalNode
class AnimalNode(DoublyLinkedListNode):
    def __init__(self, name, species):
        if species.lower() in ["cat", "dog"]:
            super(AnimalNode, self).__init__(name)
            self.species = species.lower()
        else:
            raise Exception("Not a valid species")

# ShelterQueue
class ShelterQueue:
    def __init__(self):
        self.anyQueue = DoublyLinkedList()
        self.catQueue = Queue()
        self.dogQueue = Queue()

    def __str__(self):
        return self.anyQueue.__str__()

    def enqueue(self, name, species):
        newNode = AnimalNode(name, species)
        # Adds to any queue, O(1)
        self.anyQueue.add(newNode)

        # Adds to species specific queue, O(1)
        if species == "cat":
            self.catQueue.enqueue(newNode)
        else:
            self.dogQueue.enqueue(newNode)

x = ShelterQueue()
x.enqueue("Rufus", "dog")
x.enqueue("Mittens", "cat")
x.enqueue("Spot", "dog")
x.enqueue("Colonel Whiskers", "cat")

print x
print x.catQueue
print x.dogQueue
