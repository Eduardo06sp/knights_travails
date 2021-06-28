# frozen_string_literal: true

require_relative 'game_board'
require_relative 'node'

class Tree
  def initialize(board)
    @root = build_tree(board)
  end

  def build_tree(board)
    start = gets.chomp

    until start.match?(/[0-7], [0-7]/)
      puts 'Please enter a valid coordinate (0, 0 to 7, 7)'

      start = gets.chomp
    end

    x = start[0].to_i
    y = start[3].to_i

    start_index = board.spaces.index([x, y])
    create_branches(board.spaces[start_index])
  end

  def create_branches(start)
  end
end
