require_relative 'UI'

class Board
  include UI
  def initialize
    @board = Array.new(9)
  end

  def render
    board(@board)
  end

  def assigning_value(position, value)
    position -= 1
    if valid_position?(position)
      @board[position] = value
      true
    else
      false
    end
  end

  def winning_cases?(symbol)
    winning?(horizontals, symbol) ||
      winning?(verticals, symbol) ||
      winning?(diagonals, symbol)
  end

  def full?
    @board.none?(&:nil?)
  end

  private

  def valid_position?(position)
    return true if @board[position].nil?

    taken_position
  end

  def winning?(array, symbol)
    array.any? do |test|
      test.all? { |cell| cell == symbol }
    end
  end

  def horizontals
    [[@board[0], @board[1], @board[2]], [@board[3], @board[4], @board[5]], [@board[6], @board[7], @board[8]]]
  end

  def verticals
    [[@board[0], @board[3], @board[6]], [@board[1], @board[4], @board[7]], [@board[2], @board[5], @board[8]]]
  end

  def diagonals
    [[@board[0], @board[4], @board[8]], [@board[2], @board[4], @board[6]]]
  end
end
