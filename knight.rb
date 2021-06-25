# frozen_string_literal: true

class Knight
  def initialize
    @location = nil
  end

  def possible_moves(location)
    x = location[0]
    y = location[1]

    moves = [
      [x + 1, y + 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x + 1, y - 2],
      [x - 1, y - 2],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x - 1, y + 2]
    ]

    moves.select do |move|
      x = move[0]
      y = move[1]

      (0..7).include?(x) && (0..7).include?(y)
    end
  end
end
