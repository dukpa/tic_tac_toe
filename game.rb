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

  def turn
    get_move_from_player(@current_player)

    countdown #improved game flow
    @board.print_grid
    
    unless game_over?
      switch_player
      turn
    end
  end

  def get_move_from_player(player)
    puts ""
    puts "Player #{player.xo}: Enter a move in the format 'A,1'"

    move = player.get_move
    if @board.move(player.xo, *move)
      puts "\nPlayer #{player.xo} moved to #{move[0].to_s}, #{move[1].to_s}"
    else
      puts "\nPlayer #{player.xo} made an illegal move."
      get_move_from_player(player)
    end
  end

  def game_over?
    @board.match?
  end

  def switch_player
    @current_player = @current_player == @playerX ? @playerO : @playerX
  end

  def countdown
    50.times do
      print "."
      sleep(1.0/50)
    end
    puts ""
  end
end