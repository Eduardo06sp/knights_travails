# frozen_string_literal: true

require_relative 'game_board'
require_relative 'node'

class Tree
  attr_reader :root

  def initialize(board, possible_moves, start_x, start_y, stop_x, stop_y)
    @root = build_tree(board, possible_moves, start_x, start_y, stop_x, stop_y)
  end

  def build_tree(board, possible_moves, start_x, start_y, stop_x, stop_y)
    stop_index = board.spaces.index([stop_x, stop_y])
    create_branches(board, stop_index, possible_moves, [Node.new([start_x, start_y], nil)])
  end

  def create_branches(board, stop_index, possible_moves, queue, visited = [])
    return if visited.include?(board.spaces[stop_index])

    new_queue = []

    queue.each do |coordinate|
      next if visited.include?(coordinate.value)

      current_index = board.spaces.index(coordinate.value)

      current_possible_moves = possible_moves[current_index]

      if current_possible_moves[0]
        coordinate.move_one = Node.new(current_possible_moves[0], coordinate)
        new_queue.push(coordinate.move_one)
      end

      if current_possible_moves[1]
        coordinate.move_two = Node.new(current_possible_moves[1], coordinate)
        new_queue.push(coordinate.move_two)
      end

      if current_possible_moves[2]
        coordinate.move_three = Node.new(current_possible_moves[2], coordinate)
        new_queue.push(coordinate.move_three)
      end

      if current_possible_moves[3]
        coordinate.move_four = Node.new(current_possible_moves[3], coordinate)
        new_queue.push(coordinate.move_four)
      end

      if current_possible_moves[4]
        coordinate.move_five = Node.new(current_possible_moves[4], coordinate)
        new_queue.push(coordinate.move_five)
      end

      if current_possible_moves[5]
        coordinate.move_six = Node.new(current_possible_moves[5], coordinate)
        new_queue.push(coordinate.move_six)
      end

      if current_possible_moves[6]
        coordinate.move_seven = Node.new(current_possible_moves[6], coordinate)
        new_queue.push(coordinate.move_seven)
      end

      if current_possible_moves[7]
        coordinate.move_eight = Node.new(current_possible_moves[7], coordinate)
        new_queue.push(coordinate.move_eight)
      end

      visited.push(coordinate.value)
    end

    create_branches(board, stop_index, possible_moves, new_queue, visited)

    queue.first
  end

  def level_order(stop_x, stop_y, queue = [self.root])
    return "NO DICE" if queue.first.nil?
    return queue.first if queue.first.value == [stop_x, stop_y]

    current = queue.first


    queue.push(current.move_one) if current.move_one
    queue.push(current.move_two) if current.move_two
    queue.push(current.move_three) if current.move_three
    queue.push(current.move_four) if current.move_four
    queue.push(current.move_five) if current.move_five
    queue.push(current.move_six) if current.move_six
    queue.push(current.move_seven) if current.move_seven
    queue.push(current.move_eight) if current.move_eight

    level_order(queue[1..-1])
  end

  def shortest_path(stop_x, stop_y)
    target = level_order(stop_x, stop_y)
    tmp = target

    until tmp.nil?
      p "SEARCHING; #{tmp.value}"
      tmp = tmp.predecessor
    end
  end
end
