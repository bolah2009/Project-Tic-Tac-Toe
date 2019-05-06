require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player_1 = Player.new("Thor", "X", @board)
    @player_2 = Player.new("Hulk", "O", @board)
    @current_player = @player_1
  end

  def play_game
    loop do
      @board.render
      @current_player.get_player_input
      break if game_over?
      switch_player
    end
  end

  private

  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def game_over?
    victory? || draw?
  end

  def victory?
    if @board.winning_cases?(@current_player.symbol)
      @board.render
      puts "Congratulations #{@current_player.name}, you won"
      true
    else
      false
    end
  end

  def draw?
    if @board.full?
      @board.render
      puts "Too bad. It's a draw."
      true
    else
      false
    end
  end
end
