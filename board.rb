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

  def row_match?
    @grid.any? { |row, cells| cells.all_values_match? && !cells.any_nil? }
  end

  def col_match?
    @grid.columns.any? do |col, cells|
      cells.all_values_match? && !cells.any_nil?
    end
  end

  def cross_match?
    @grid.crosses.any? do |cross, cells|
      cells.all_values_match? && !cells.any_nil?
    end
  end
end