require_relative 'tile'
require 'byebug'

class Board
    attr_reader :grid, :grid_size
    
    def initialize(grid_size=9, num_bombs)
        @grid_size, @num_bombs = grid_size, num_bombs
        generate_board
    end

    def generate_board
        @grid = Array.new(grid_size) do |row|
            Array.new(grid_size) do |col|
                Tile.new(self, [row, col])
            end
        end

        
        total_bomb_placed = 0
        # make a random integer for the value of bombs
        while total_bomb_placed < @num_bombs
            random_pos = Array.new(2) { rand(grid_size) }
            # p self[random_pos].inspect
            self[random_pos].place_bomb

            total_bomb_placed += 1
        end
    end


    def [](pos)
        row, col = pos
        @grid[row][col]
    end

end

# p pandu = Board.new(9, 5)
new = Board.new(9, 5)