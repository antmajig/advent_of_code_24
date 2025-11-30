def part_one
  input = File.read("input.txt")
  functions = get_mul(input)
  
  puts total_value(functions)
end

def part_two
  input = File.read("input.txt")
  functions = get_mul_with_instructions(input)

  puts total_value(functions)
end

def get_mul(input)
  regex = /mul\(\d{1,3},\d{1,3}\)/
  input.scan(regex)
end

def get_mul_with_instructions(input)
  regex = /mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/

  functions = input.scan(regex)
  enabled = true

  functions.map do |f|
    if f == "do()"
      enabled = true
      next
    end

    if f == "don't()"
      enabled = false
      next
    end

    enabled ? f : nil
  end.compact
end

def total_value(functions)
  total = 0
  functions.each do |f|
    regex = /\d{1,3}/
    values = f.scan(regex)
    total += values[0].to_i * values[1].to_i
  end

  total
end

part_two
