class Player
  attr_reader :xo

  def initialize(xo)
    @xo = xo
  end

  def get_move
    move = nil
    regex = /[a-cA-C],[1-3]/

    until move = gets.chomp[regex]
      puts "Enter a move in the correct format"
    end
    
    [move[0].downcase.to_sym, move[2].to_i - 1]
  end
end