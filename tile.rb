require_relative 'board'

class Tile
    def initialize(board, pos)
        @board, @pos = board, pos
        # bombed? flagged? revealed?
        @bombed, @flagged, @revealed = false, false, false
    end

    def place_bomb
        @bombed = true
    end
end

=begin

    Tile.new(self, [1, 2])

=end