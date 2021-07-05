# frozen_string_literal: true

require_relative 'game_board'
require_relative 'knight'
require_relative 'tree'

def intro
  puts '---------------------------------------------------------------------------------------------------------------'
  puts 'Please enter the starting coordinate (e.g. "0, 0")'

  start = gets.chomp

  until start.match?(/[0-7], [0-7]/)
    puts 'Please enter a valid coordinate (0, 0 to 7, 7)'

    start = gets.chomp
  end

  puts 'Now enter the target coordinate (e.g. "1, 2")'

  stop = gets.chomp

  until stop.match?(/[0-7], [0-7]/)
    puts 'Please enter a valid coordinate (0, 0 to 7, 7)'

    stop = gets.chomp
  end

  start_x = start[0].to_i
  start_y = start[3].to_i
  stop_x = stop[0].to_i
  stop_y = stop[3].to_i

  test_board = GameBoard.new
  test_piece = Knight.new
  test_moves = test_board.all_possible_moves(test_piece)
  test = Tree.new(test_board, test_moves, start_x, start_y, stop_x, stop_y)

  puts '---------------------------------------------------------------------------------------------------------------'

  test.shortest_path(stop_x, stop_y)
end

intro
