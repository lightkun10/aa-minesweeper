require_relative 'board'

class Tile
    attr_reader :pos

    DELTAS = [ 
        [-1, -1],
        [-1, 0],
        [-1, 1],
        [0, -1],
        [0, 1],
        [1, -1],
        [1, -1],
        [1, 0],
        [1, 1] 
    ]

    def initialize(board, pos)
        @board, @pos = board, pos
        @bombed, @flagged, @explored = false, false, false
    end

    def bombed?
        @bombed
    end
    
    def flagged?
        @flagged
    end

    def explored?
        @explored
    end

    ## some helpful methods you could write 
    #   reveal, neighbor_bomb_count)

    def inspect
        { pos: pos, 
          bombed: bombed?, 
          flagged: flagged?, 
          explored: explored? 
        }.inspect
    end

    def place_bomb
        @bombed = true
    end

    def neighbors
       x = pos[0]
       y = pos[1]

       adjacent_coordinates = DELTAS.map do |(delta_x, delta_y)|
            [ x + delta_x, y + delta_y ]
       end

       adjacent_coordinates.select do |row, col|
            [row, col].all? { |coordinate| coordinate.between?(0, @board.size - 1) }
       end
    end

end

# test_tile = Tile.new(12, 2)
# p test_tile.pos
# p test_tile.flagged?
# p test_tile.board

# test_tile = Tile.new('board.rb', [2, 1])
# # test_tile.neighbors
# p test_tile.board

=begin

    === about position ===

    tile_1.pos[0], tile_1.pos[1] 

    row(x-coordinate)    :      pos[0]
    column(y-coordinate) :      pos[1]

=end