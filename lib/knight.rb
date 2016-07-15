require_relative '00_tree_node'

class KnightPathFinder
  DELTAS = [
    [-2, -1],
    [-2, 1],
    [-1, 2],
    [1, 2],
    [2, 1],
    [2, -1],
    [1, -2],
    [-1, -2]
  ]

  attr_reader :start_pos, :visited_pos, :root

  def initialize(pos)
    @start_pos = pos
    @visited_pos = [start_pos]
    @root = build_move_tree
  end

  def self.valid_moves(pos)
    moves = []
    x, y = pos

    DELTAS.each do |delta|
      i, j = delta
      possible_move = [x + i, y + j]
      moves << possible_move if is_on_board?(possible_move)
    end

    moves
  end

  #receives position coordinates, returns false if is off board
  def self.is_on_board?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end


  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).reject{|move| visited_pos.include?(move)}
    new_moves.each {|move| visited_pos << move}
    new_moves
  end

  def build_move_tree
    root = PolyTreeNode.new(start_pos)
    queue = [root]

    until queue.empty?
      parent = queue.shift

      children = new_move_positions(parent.value) #parent.value = pos(Array)


      children.each do |child_pos|
        child = PolyTreeNode.new(child_pos)
        child.parent = parent
        queue << child
      end
    end

    root
  end


end
