class Board
  attr_reader :size
  
    def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = ( n * n )
  end

  def size
    @size
  end

  def [](arr)
    row, col = arr
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  def attack(position)
    if self[position] == :S 
        self[position] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[position] = :X 
        return false
    end 
  end

  def place_random_ships
    total = @size * 0.25
    while self.num_ships < total
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        pos = [ rand_row, rand_col ]
        self[pos] = :S 
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map do |ele|
            if ele == :S 
                :N 
            else
                ele
            end
        end
    end
  end

  def self.print_grid(array)
    @grid.map do |row|
        puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
