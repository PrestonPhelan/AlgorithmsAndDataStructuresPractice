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

def quick_sort_in_place!(array, start = 0, finish = array.length - 1, &prc)
  return if array.length <= 1 || start >= finish
  prc ||= Proc.new { |el1, el2| el1 - el2 }

  part_idx = start + ((finish - start + 1) / 2)

  array[part_idx], array[finish] = array[finish], array[part_idx]
  pivot = array[finish]

  i = start #tracks number of left-side values
  j = start #tracks index currently checking

  until j == finish
    if prc.call(array[j], pivot) < 0
      array[i], array[j] = array[j], array[i]
      i += 1
    end
    j += 1
  end

  array[i], array[j] = array[j], array[i]

  quick_sort_in_place!(array, start, i - 1, &prc)
  quick_sort_in_place!(array, i + 1, finish, &prc)

  array
end

# a = Array.new(8) { rand(1...9) }
# print a
# puts ""
#
# quick_sort_in_place!(a)
#
# print a
# puts ""
