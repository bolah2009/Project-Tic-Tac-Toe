require_relative "board"

class Player
  attr_accessor :name, :symbol
  def initialize(name = "Nameless Player", symbol, board)
    @name = name
    @symbol = symbol
    @board = board
  end

  def get_player_input
    loop do
      position = get_position
      if valid_input_position?(position)
        break if @board.assigning_value(position, @symbol)
      end
    end
  end

  private

  def get_position
    puts "#{name}(#{@symbol}): It's your turn. Make your move!"
    gets.chomp.to_i
  end

  def valid_input_position?(position)
    if position.is_a? Integer
      true
    else
      puts "Please insert a number from 1 to 9."
    end
  end
end
