from collections import Counter

# Main function - input integer, output permutations as an array
def parens(n):
    if n <= 0:
        return []

    count = 1
    result = ["()"]

    while count < n:
        result = get_next_parens(result)
        count += 1

    return result


# Get next set of permutations
def get_next_parens(perms):
    result = []
    for perm in perms:
        next_perms = get_n_plus_1_perms(perm)
        result += next_perms

    return result

# Take single n-permutation, produce n + 1 permutations as an array
def get_n_plus_1_perms(perm):
    result = []
    result.append("(" + perm + ")")
    result.append(perm + "()")
    if perm[-2:] != "()":
        result.append("()" + perm)

    return result
