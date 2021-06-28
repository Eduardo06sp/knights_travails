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

  def create_branches(board, start_index, possible_moves, predecessor = nil, visited = [])
    return if visited.include?(board.spaces[start_index])

    root = Node.new(board.spaces[start_index])
    root.predecessor = predecessor

    visited.push(root.value)

    current_possible_moves = possible_moves[start_index]

    if current_possible_moves[0]
      root.move_one = create_branches(board, board.spaces.index(current_possible_moves[0]), possible_moves, root, visited)
    end

    if current_possible_moves[1]
      root.move_two = create_branches(board, board.spaces.index(current_possible_moves[1]), possible_moves, root, visited)
    end

    if current_possible_moves[2]
      root.move_three = create_branches(board, board.spaces.index(current_possible_moves[2]), possible_moves, root, visited)
    end

    if current_possible_moves[3]
      root.move_four = create_branches(board, board.spaces.index(current_possible_moves[3]), possible_moves, root, visited)
    end

    if current_possible_moves[4]
      root.move_five = create_branches(board, board.spaces.index(current_possible_moves[4]), possible_moves, root, visited)
    end

    if current_possible_moves[5]
      root.move_six = create_branches(board, board.spaces.index(current_possible_moves[5]), possible_moves, root, visited)
    end

    if current_possible_moves[6]
      root.move_seven = create_branches(board, board.spaces.index(current_possible_moves[6]), possible_moves, root, visited)
    end

    if current_possible_moves[7]
      root.move_eight = create_branches(board, board.spaces.index(current_possible_moves[7]), possible_moves, root, visited)
    end

    root
  end
end

test_board = GameBoard.new
test_piece = Knight.new
test_moves = test_board.all_possible_moves(test_piece)
test = Tree.new(test_board, test_moves)
