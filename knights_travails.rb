# frozen_string_literal: true

# Handle locations on the chess board and creates structure based on moves.
class Node
  attr_accessor :current_point, :parent_node, :child_node

  KNIGHT_MOVE_SET = [[-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1], [2, 1], [1, 2]].freeze

  def initialize(point = nil, parent = nil)
    @current_point = point
    @parent_node = parent
    @child_node = []
  end

  # Accepts 2D arrays of points [x, y], checks each point is a valid location on 8x8 chess board. Returns valid points.
  def validator(array)
    valid_points = []
    array.each do |point|
      valid_points << point if point.all?(1..8)
    end
    valid_points
  end

  # From a given node, try all moves and return valid locations.
  def child_gen(node)
    point = node.current_point
    possible_child_nodes = []
    KNIGHT_MOVE_SET.each do |move|
      possible_child_nodes << [point[0] + move[0], point[1] + move[1]]
    end
    validator(possible_child_nodes)
  end
end

def knight_moves(start_point, end_point)
  return print 'Invalid location. Must be between 1-8' unless Node.new.validator([start_point, end_point]).length == 2
  return print 'No moves required.' if start_point == end_point

  start = Node.new(start_point)
  p Node.new.child_gen(start)
end

knight_moves([3, 8], [3, 4])
