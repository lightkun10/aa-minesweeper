require_relative 'tile'

class Board
    attr_reader :grid_size, :num_of_bombs

    def initialize(grid_size, num_of_bombs)
        @grid_size, @num_of_bombs = grid_size, num_of_bombs

        # make tile on each board's row
        Array.new(@grid_size) do |row|
            Array.new(@grid_size) do |col|
                Tile.new(self, [row, col])
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row, col]
    end
end

new = Board.new(9, 5)