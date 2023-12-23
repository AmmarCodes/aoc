# frozen_string_literal: true

content = File.open('./sample-input.txt')

shared_items = []
content.each do |pack|
  # split the content in half, and find the common letter in both halves
  str1, str2 = pack.chomp.split('').each_slice(pack.length / 2).to_a
  item = (str1 & str2).first.ord
  # convert the letter to its priority (a => 1, A => 27)
  item = item >= 97 ? item - 96 : item - 38 # (- 65 + 27)
  shared_items << item
end

# return the sum of the priorities
puts shared_items.sum
