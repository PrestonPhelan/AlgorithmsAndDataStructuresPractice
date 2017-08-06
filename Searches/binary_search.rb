def binary_search(array, target)
  return nil if array.empty?

  pivot_idx = array.length / 2
  pivot = array[pivot_idx]
  return pivot_idx if pivot == target

  if target < pivot
    binary_search(array[0...pivot_idx], target)
  else
    pivot_idx + binary_search(array[(pivot_idx + 1)..-1], target) + 1
  end
end

# a = [0, 1, 2, 3, 4, 5, 6, 7, 8]
# puts binary_search(a, 5)
#
# b = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# puts binary_search(b, 5)
