class Board
  def initialize
    @board = Array.new(9)
  end

  def render
    puts "-------------"
    @board.each_slice(3) do |slice|
      print("| ")
      slice.each do|cell|
        cell.nil? ? print("-") : print(cell)
        print(" | ")
      end
      print("\n")
    end
    puts "-------------"
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
    @board.none? { |cell| cell.nil? }
  end

  private

  def valid_position?(position)
    if within_valid_position?(position)
      position_available?(position)
    end
  end

  def position_available?(position)
    if (@board[position].nil?)
      true
    else
      puts "This position was already taken! Choose another one."
    end
  end

  def within_valid_position?(position)
    if (0..8).include?(position)
      true
    else
      puts "Position out of bounds"
    end
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
