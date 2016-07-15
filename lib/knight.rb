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

  def initialize(pos)
    @start_pos = pos
    #call build move tree
  end

  def self.valid_moves(pos)
    moves = []
    x, y = pos

    DELTAS.each do |delta|
      i, j = delta
      moves << [x + i, y + j]
    end

    moves
  end

  def new_move_positions

  end



end
