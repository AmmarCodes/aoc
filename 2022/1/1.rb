file = File.open('./input.txt').read
elves = file.split("\n\n").map do |elve|
  elve.split("\n").map(&:to_i).sum
end
puts "Max elve: #{elves.max}"
puts "Max 3 elves #{elves.sort.last(3).sum}"
