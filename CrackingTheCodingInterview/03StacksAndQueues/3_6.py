# Animal Shelter
class LinkedListNode(object):
    def __init__(self, value=None):
        self.value = "HEAD" if value is None else value
        self.next = None

    def __str__(self):
        return self.value

    def __repr__(self):
        return self.value

class ShelterNode(LinkedListNode):
    def __init__(self, value, species):
        super(ShelterNode, self).__init__(value)
        self.species = species

class LinkedList(object):
    def __init__(self):
        self.head = LinkedListNode()
        self.tail = self.head


    def __str__(self):
        result = []
        currentNode = self.head
        result.append(currentNode)
        while currentNode.next is not None:
            currentNode = currentNode.next
            result.append(currentNode)

        return result.__str__()

class ShelterQueue(LinkedList):
    def enqueue(self, value, species):
        newNode = ShelterNode(value, species)
        self.tail.next = newNode
        self.tail = newNode
        return newNode

    def adoptAny(self):
        toAdopt = self.head.next
        self.head.next = toAdopt.next
        toAdopt.next = None
        return toAdopt

    def isEmpty(self):
        return self.head.next is None

x = ShelterQueue()
x.enqueue("Rufus", "dog")
print x

print x.isEmpty()

print x.adoptAny()
print x

print x.isEmpty()
