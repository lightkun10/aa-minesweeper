require_relative "tile.rb"

class Board
    attr_reader :grid, :grid_size
    
    def initialize(grid_size, num_bombs)
        @grid_size, @num_bombs = grid_size, num_bombs
        generate_board
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def generate_board
        Array.new(@grid_size) do |row|
            Array.new(@grid_size) do|col|
                Tiles.new(self, [row, col])
            end
        end
    end

end


if $PROGRAM_NAME == __FILE__
    Board.new(9, 5)
    puts "This will only be printed when directly launched."
end