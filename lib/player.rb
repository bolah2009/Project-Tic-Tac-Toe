require_relative 'UI'

class Player
  include UI
  attr_accessor :name, :symbol
  def initialize(name = 'Nameless Player', symbol, board)
    @name = name
    @symbol = symbol
    @board = board
  end

  def get_player_input
    loop do
      position = get_position

      break if @board.assigning_value(position, @symbol)
      taken_position
    end
  end

  private

  def get_position
    turns(name, @symbol)
    get_valid_input
  end
end
