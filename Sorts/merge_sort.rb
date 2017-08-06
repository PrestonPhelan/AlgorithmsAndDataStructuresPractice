# Merge Sort
# Runtime: O(n log(n)), Memory: O(n)

def merge_sort(array, &prc)
  return array if array.length <= 1

  prc ||= Proc.new { |el1, el2| el1 - el2 }

  mid_idx = array.length / 2
  sorted_left = merge_sort(array[0...mid_idx], prc)
  sorted_right = merge_sort(array[mid_idx..-1], prc)

  sorted = []
  until sorted_left.empty? || sorted_right.empty?
    if prc.call(sorted_left.first, sorted_right.first) <= 0
      sorted << sorted_left.shift
    else
      sorted << sorted_right.shift
    end
  end

  sorted + sorted_left + sorted_right
end
