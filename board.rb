require './custom_array'
require './board_hash'

class Board
  def initialize
    @grid = BoardHash.new
  end

  def print_grid
    puts ""
    puts "The Board"
    puts "- - - - -"
    puts "  1|2|3"

    @grid.each do |row, cells|
      puts "  -----"
      print "#{row} #{@grid[row][0] || "*"}|"\
        "#{@grid[row][1] || "*"}|"\
        "#{@grid[row][2] || "*"}"
      puts ""
    end
  end

  def move(xo, row, col)
    if @grid[row][col]
      false
    else
      @grid[row][col] = xo
    end
  end

  def grid_full?
    @grid.all? do |row, cells|
      cells.none? { |cell| cell.nil?}
    end
  end

  def match?
    row_match? || col_match? || cross_match?
  end

  private

  def find_match(grid)
    grid.any? { |row, cells| cells.all_values_match? && !cells.any_nil? }
  end

  def row_match?
    find_match(@grid)
  end

  def col_match?
    find_match(@grid.columns)
  end

  def cross_match?
    find_match(@grid.crosses)
  end
end