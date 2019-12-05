require_relative 'tile'

class Board
    attr_reader :grid_size, :num_of_bombs

    def initialize(grid_size, num_of_bombs)
        @grid_size, @num_of_bombs = grid_size, num_of_bombs

        # make tile on each board's row
        @grid = Array.new(@grid_size) do |row|
            Array.new(@grid_size) do |col|
                Tile.new(self, [row, col])
            end
        end

        # plant a bomb
            # place a random position in the board
            # need a random array consist of two element [3, 1]
            # number strictly from 0 to size of the grid

        random_pos = Array.new(2) { rand(@grid_size) }
        self[random_pos].plant_bomb
        
    end

    def [](pos)
        row, col = pos
        @grid[row, col]
    end
end

if $PROGRAM_NAME == __FILE__
    Board.new(9, 5)
    puts "\nThis will only be printed when directly launched."
end