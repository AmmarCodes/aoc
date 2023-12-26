# frozen_string_literal: true

points = 0

File.open('./input.txt').each do |card|
  winning, numbers = card.chomp.split(':')[1].split('|')
  winning = winning.split(/\D+/)[1..].map(&:to_i)
  numbers = numbers.split(/\D+/)[1..].map(&:to_i)

  count = winning.intersection(numbers).length

  unless count.zero?
    points += count > 1 ? 2.pow(count - 1) : 1
  end
end

puts points
