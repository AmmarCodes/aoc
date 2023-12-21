file = File.open('./input.txt')

results = 0
power = 0
criteria = { red: 12, green: 13, blue: 14 }

file.each do |line|
  possible = true
  (game_id, game) = line.chomp.split(/Game (\d+): /)[1, 2]

  # turns
  turn = {red: 0, green: 0, blue: 0}
  game_colors = {red: 0, green: 0, blue: 0}
  game.split(';').each do |t|
    t.split(',').map do |e|
      splitted = e.split
      value = splitted[0].to_i
      key = splitted[1].to_sym
      turn[key] += value
      if criteria[key] < value
        possible = false
      end

      # set the minimum number of each color for this game
      game_colors[key] = value if game_colors[key] < value
    end
  end

  # if the game is possible, add the game id to the results
  results += game_id.to_i if possible

  # add the result of multiply count of red * blue * green
  power += game_colors.values().inject(:*)
end

puts "Part 1: #{results}"
puts "Part 2: #{power}"
