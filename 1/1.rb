def insert_in_sorted_array(arr, num)
  insert_at = arr.bsearch_index { |i| i >= num }
  if insert_at
    arr.insert(insert_at, num)
  else
    arr.append(num)
  end
end

def part_one
  lines = File.readlines("input.txt")
  list_a = []
  list_b = []

  lines.each do |line|
    nums = line.split().map(&:to_i)
    if list_a.size == 0
      list_a.append(nums[0])
      list_b.append(nums[1])
    else
      insert_in_sorted_array(list_a, nums[0])
      insert_in_sorted_array(list_b, nums[1])
    end
  end

  counter = 0
  list_a.size.times do |i|
    counter += (list_a[i] - list_b[i]).abs
  end

  p counter
end

def part_two
  lines = File.readlines("input.txt")
  hash_a = {}
  hash_b = {}

  hash_a.default = 0
  hash_b.default = 0
  lines.each do |line|
    nums = line.split().map(&:to_i)
    hash_a[nums[0]] += 1
    hash_b[nums[1]] += 1
  end

  counter = 0
  hash_a.each do |key, value|
    counter += (key * hash_b[key]) * value
  end

  p counter
end


part_two
