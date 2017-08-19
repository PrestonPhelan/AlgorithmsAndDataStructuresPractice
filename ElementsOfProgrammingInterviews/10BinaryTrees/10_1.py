class BinaryTree:
    def __init__(self, root):
        self.root = root

    def isHeightBalanced(self):
        return self.root.isHeightBalancedBelow()

class BinaryTreeNode:
    def __init__(self, value=None):
        self.value = value
        self.left = None
        self.right = None

    def isLeaf(self):
        return not self.left and not self.right

    # Check height balance below
    def isHeightBalancedBelow(self):
        # Ask left child for info
        leftRes = self.getNodeHeightResponse(self.left)
        # If returns false, return False
        if leftRes is False:
            return False
        # Else it returns left child's height

        # Ask right child for info
        rightRes = self.getNodeHeightResponse(self.right)
        # If returns false, return false
        if rightRes is False:
            return False

        # Else, compare heights
        return -1 <= leftRes - rightRes <= 1


    def getNodeHeightResponse(self, node):
        if node is None:
            return -1
        elif node.isLeaf():
            return 0
        else:
            leftRes = self.getNodeHeightResponse(node.left)
            if leftRes is False:
                return False

            rightRes = self.getNodeHeightResponse(node.right)
            if rightRes is False:
                return False

            return max([leftRes, rightRes]) + 1


root = BinaryTreeNode("root")

tree = BinaryTree(root)

print tree.isHeightBalanced()

leftChild1 = BinaryTreeNode("aewrgtaer")
root.left = leftChild1

print tree.isHeightBalanced()

leftChild2 = BinaryTreeNode("aergaer")
leftChild1.left = leftChild2

print tree.isHeightBalanced()
