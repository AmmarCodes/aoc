content = File.open('./input.txt')

shape_score = { rock: 1, paper: 2, scissors: 3 }
shapes = {
  A: :rock,
  X: :rock,
  B: :paper,
  Y: :paper,
  C: :scissors,
  Z: :scissors
}

score = 0
content.each do |round|
  players = round.split(' ')
  player = shapes[players[0].to_sym]
  me = shapes[players[1].to_sym]
  score += shape_score[me]

  # draw
  if me == player
    score += 3
  # win
  elsif (me == :rock && player == :scissors) || (me == :paper && player == :rock) || (me == :scissors && player == :paper)
    score += 6
    # lose
    # else
    #   score += 0
  end
end

puts "Total score: #{score}"
