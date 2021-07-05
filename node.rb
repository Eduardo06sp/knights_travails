# frozen_string_literal: true

class Node
  attr_accessor :value,
                :predecessor,
                :move_one,
                :move_two,
                :move_three,
                :move_four,
                :move_five,
                :move_six,
                :move_seven,
                :move_eight

  def initialize(coordinates, predecessor)
    @value = coordinates
    @predecessor = predecessor
    @move_one = nil
    @move_two = nil
    @move_three = nil
    @move_four = nil
    @move_five = nil
    @move_six = nil
    @move_seven = nil
    @move_eight = nil
  end
end
