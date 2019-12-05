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
        [1, 0],
        [1, 1]
    ].freeze

    def initialize(board, pos)
        @board, @pos = board, pos
        # bombed? flagged? revealed?
        @bombed, @flagged, @revealed = false, false, false
    end

    def bombed?
        @bombed
    end

    def flagged?
        @flagged
    end

    def revealed?
        @revealed
    end

    def inspect
        {
            pos: pos,
            bombed: bombed?,
            flagged: flagged?,
            revealed: revealed?
        }.inspect
    end

    def neighbors
        x = pos[0]
        y = pos[1]

        adjacent_coordinates = DELTAS.map do |delta_x, delta_y|
            [ x + delta_x, y + delta_y ]
        end

        selected_adj_pos = adjacent_coordinates.select do |coordinates|
            coordinates.all? { |coord| coord.between?(0, @board.size - 1) }
        end

        selected_adj_pos.map { |pos| @board[pos] }
    end

    def plant_bomb
        @bombed = true
    end
end