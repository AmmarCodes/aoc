# frozen_string_literal: true

sum = 0
File.open('./input.txt').readlines.each_slice(3).each do |group|
  group.map! { |a| a.split('') }
  item = (group[0] & group[1] & group[2]).first.ord
  sum += item >= 97 ? item - 96 : item - 38 # (- 65 + 27)
end
puts sum
