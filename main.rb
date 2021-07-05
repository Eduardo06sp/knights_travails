# frozen_string_literal: true

require_relative 'game_board'
require_relative 'knight'
require_relative 'tree'

test_board = GameBoard.new
test_piece = Knight.new
test_moves = test_board.all_possible_moves(test_piece)
test = Tree.new(test_board, test_moves)
test.shortest_path
