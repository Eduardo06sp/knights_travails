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
  end
end
