require_relative 'UI'

class Game
  include UI
  def initialize(player1, player2, board)
    @board = board
    @player_1 = player1
    @player_2 = player2
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
      win_message
      true
    else
      false
    end
  end

  def draw?
    if @board.full?
      @board.render
      draw_message
      true
    else
      false
    end
  end
end
