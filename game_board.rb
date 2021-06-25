# frozen_string_literal: true

class GameBoard
  def initialize
    @spaces = create_board
  end

  def create_board
    start = [0, 0]
    finish = [7, 7]
    spaces = []

    x = 0
    y = 0

    until x > 7
      until y > 7
        current = [x, y]

        spaces.push(current)
        y += 1
      end

      x += 1
      y = 0
    end

    spaces
  end
end
