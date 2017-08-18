# 9.1 - Implement a stack with MAX API
class Stack:
    # A basic stack
    stack = []

    def add(self, element):
        self.stack.append(element)
        return True

    def take(self):
        return self.stack.pop()

    def peek(self):
        return self.stack[-1]

    def isEmpty(self):
        return not self.stack

# class MaxStack:
#     # Inherits from basic stack, tracks maximum
#     def


x = Stack()

print "Is empty?"
print x.isEmpty()

print "Adds element 'test'"
x.add('test')
print x.stack

print "Peek"
print x.peek()

print "Is not empty?"
print x.isEmpty()

print "Takes"
print x.take()

print "Should be empty"
print x.stack
