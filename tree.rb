# frozen_string_literal: true

require_relative 'game_board'
require_relative 'node'

class Tree
  def initialize(board, possible_moves)
    @root = build_tree(board, possible_moves)
  end

  def build_tree(board, possible_moves)
    start = gets.chomp

    until start.match?(/[0-7], [0-7]/)
      puts 'Please enter a valid coordinate (0, 0 to 7, 7)'

      start = gets.chomp
    end

    x = start[0].to_i
    y = start[3].to_i

    start_index = board.spaces.index([x, y])
    create_branches(board, start_index, possible_moves)
  end

  def create_branches(board, start_index, possible_moves, predecessor = nil)
    root = Node.new(board.spaces[start_index], possible_moves[start_index])

    p root.value
  end
end

test_board = GameBoard.new
test_piece = Knight.new
test_moves = test_board.all_possible_moves(test_piece)
test = Tree.new(test_board, test_moves)
