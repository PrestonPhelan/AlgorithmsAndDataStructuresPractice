# Quick Sort
# Runtime: O(n log(n)) average, O(n^2) worst-case, Memory: O(log(n))

def quick_sort(array, &prc)
  return array if array.length <= 1
  prc ||= Proc.new { |el1, el2| el1 - el2 }

  part_idx = array.length / 2
  part_val = array[part_idx]

  left = []
  right = []

  array.each_with_index do |el, idx|
    next if idx == part_idx
    prc.call(el, part_val) <= 0 ? left << el : right << el
  end

  quick_sort(left, &prc) + [part_val] + quick_sort(right, &prc)
end
