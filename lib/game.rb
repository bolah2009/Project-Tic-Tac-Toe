require_relative 'UI'

class Game
  include UI
  attr_reader :current_player
  def initialize(player1, player2, board)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play_game
    loop do
      @board.render
      @current_player.get_player_input
      if victory?
        @board.render
        return win_message
      elsif draw?
        @board.render
        return draw_message
      end
      switch_player
    end
  end

  private

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def victory?
    return true if @board.winning_cases?(@current_player.symbol)

    false
  end

  def draw?
    return true if @board.full?

    false
  end
end
