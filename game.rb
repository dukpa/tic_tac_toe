require './player'
require './board'

class Game
  def initialize
    @board = Board.new
    @playerX = Player.new('X')
    @playerO = Player.new('O')
    
    @current_player = @playerX
    @board.print_grid
    turn
  end

  private

  def turn
    get_move_from_player

    countdown #improved game flow
    @board.print_grid
    
    unless game_over?
      switch_player
      turn
    end
  end

  def get_move_from_player
    puts ""
    puts "Player #{@current_player.xo}: Enter a move in the format 'A,1'"

    move = @current_player.get_move
    if @board.move(@current_player.xo, *move)
      puts "\nPlayer #{@current_player.xo} moved to "\
        "#{move[0].to_s}, #{move[1].to_s}"
    else
      puts "\nPlayer #{@current_player.xo} made an illegal move."
      get_move_from_player
    end
  end

  def game_over?
    if @board.match?
      puts "\nPlayer #{@current_player.xo} wins!"
    elsif @board.grid_full?
      puts "\nThe game is a draw!"
    else
      return false
    end
    return true
  end

  def switch_player
    @current_player = @current_player == @playerX ? @playerO : @playerX
  end

  def countdown
    50.times do
      print "."
      sleep(0.01)
    end
    puts ""
  end
end