# frozen_string_literal: true

content = File.open('./input.txt')

shape_score = { rock: 1, paper: 2, scissors: 3 }
win_score = { lose: 0, draw: 3, win: 6 }

shapes = {
  A: :rock,
  B: :paper,
  C: :scissors,
  X: :lose,
  Y: :draw,
  Z: :win
}

my_picks = {
  lose: {
    rock: :scissors,
    paper: :rock,
    scissors: :paper
  },

  win: {
    rock: :paper,
    scissors: :rock,
    paper: :scissors
  }
}

part_2_score = 0
content.each do |round|
  players = round.split(' ')
  opponent = shapes[players[0].to_sym]
  result = shapes[players[1].to_sym]
  part_2_score += win_score[result]
  my_pick = if result == :draw
              opponent
            else
              my_picks[result][opponent]
            end

  # add my_pick part_2_score
  part_2_score += shape_score[my_pick]
end

puts "Part 2 score: #{part_2_score}"
