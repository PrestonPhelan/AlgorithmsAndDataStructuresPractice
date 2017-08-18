# 9.1 - Implement a stack with MAX API
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

class MaxStack(Stack):
    def __init__(self):
        super(MaxStack, self).__init__()
        self.maxStack = Stack()

    def add(self, element):
        super(MaxStack, self).add(element)
        if self.maxStack.isEmpty() or self.maxStack.peek() <= element:
            self.maxStack.add(element)
        return element

    def take(self):
        topElement = self.peek()
        if topElement == self.max():
            self.maxStack.take()
        return super(MaxStack, self).take()

    def max(self):
        return self.maxStack.peek()


# x = Stack()
#
# print "Is empty?"
# print x.isEmpty()
#
# print "Adds element 'test'"
# x.add('test')
# print x.stack
#
# print "Peek"
# print x.peek()
#
# print "Is not empty?"
# print x.isEmpty()
#
# print "Takes"
# print x.take()
#
# print "Should be empty"
# print x.stack

# x = MaxStack()
# x.add(72)
# x.add(66)
# x.add(8)
# x.add(27)
# x.add(44)
# x.add(33)
# x.add(25)
# x.add(18)
# x.add(8)
# x.add(80)
#
# print "isEmpty should be false"
# print x.isEmpty()
# print ""
#
# print "Current stack"
# print x.stack
# print ""
#
# print "peek should be 80"
# print x.peek()
# print ""
#
# print "maxStack"
# print x.maxStack.stack
# print ""
#
#
# print "max should be 80"
# print x.max()
# print ""
#
# print "Popping 80"
# print x.take()
#
# print "Max stack should just be [72]"
# print x.maxStack.stack
#
# print "Max should be 72"
# print x.max()
