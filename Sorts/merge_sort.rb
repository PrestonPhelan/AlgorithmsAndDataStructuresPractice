# Merge Sort
# Runtime: O(n log(n)), Memory: O(n)

def merge_sort(array)
  return array if array.length <= 1

  mid_idx = array.length / 2
  sorted_left = merge_sort(array[0...mid_idx])
  sorted_right = merge_sort(array[mid_idx..-1])

  sorted = []
  until sorted_left.empty? || sorted_right.empty?
    if sorted_left.first <= sorted_right.first
      sorted << sorted_left.shift
    else
      sorted << sorted_right.shift
    end
  end

  sorted + sorted_left + sorted_right
end
