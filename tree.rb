# frozen_string_literal: true

require_relative 'game_board'
require_relative 'node'

class Tree
  def initialize
    @root = build_tree
  end
end
