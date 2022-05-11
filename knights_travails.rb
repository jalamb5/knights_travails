# frozen_string_literal: true

# Handle locations on the chess board and creates structure based on moves.
class Node
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
end

def knight_moves(start_point, end_point)
  print 'Invalid location(s). Must be between 1-8' unless Node.new.validator([start_point, end_point]).length == 2
  print 'No moves required.' if start_point == end_point
  start = Node.new(start_point)
end

knight_moves([3, 3], [3, 3])
