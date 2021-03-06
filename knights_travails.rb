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
    valid_child_nodes = validator(possible_child_nodes)
    valid_child_nodes.each do |child|
      child_node = Node.new(child, node)
      node.child_node << child_node
    end
    valid_child_nodes
  end

  def find_path(node)
    path = []
    until node.nil?
      path << node.current_point
      node = node.parent_node
    end
    path.reverse
  end

  # TODO: print out connections between node and child nodes
  def pretty_print(node)
    puts "#{node.current_point} -> #{node.child_node}"
  end
end

def knight_moves(start_point, end_point)
  return print 'Invalid location. Must be between 1-8' unless Node.new.validator([start_point, end_point]).length == 2
  return print 'No moves required.' if start_point == end_point

  current_node = Node.new(start_point)
  new_nodes = Queue.new

  until current_node.current_point == end_point
    children = move(current_node)
    children.each { |child| new_nodes << child }
    current_node = new_nodes.pop
  end
  p Node.new.find_path(current_node)
end

# create child nodes, send nodes back to original call
def move(node)
  Node.new.child_gen(node)
  new_nodes = []
  node.child_node.each { |child| new_nodes << child }
  new_nodes
end

knight_moves([3, 8], [7, 4])
