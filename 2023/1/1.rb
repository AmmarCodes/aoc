file = File.open('./input.txt')
map = {
  "one" => "o1e",
  "two" => "t2o",
  "three" => "t3e",
  "four" => "f4r",
  "five" => "f5e",
  "six" => 6,
  "seven" => "s7n",
  "eight" => "e8t",
  "nine" => "n9e"
}
keys = map.keys().join('|')
total = 0
file.each do |e|
  e.gsub!(Regexp.new(keys), map)
  # second run to handle entangled cases like "threeight"
  e.gsub!(Regexp.new(keys), map)
  nums = e.gsub(/\D*(\d).*(\d)\D*/, '\1\2')
  nums = nums.gsub(/\D*(\d)\D*/, '\1')
  total += (nums[0] + nums[-1]).to_i
end

puts total
