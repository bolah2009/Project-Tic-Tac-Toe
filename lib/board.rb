# Board class
class Board
  def initialize
    @board_hash = initHash
  end

  def show_board
    puts "#{@board_hash[1]} | #{@board_hash[2]} | #{@board_hash[3]} "
    puts "#{@board_hash[4]} | #{@board_hash[5]} | #{@board_hash[6]} "
    puts "#{@board_hash[7]} | #{@board_hash[8]} | #{@board_hash[9]} "
  end

  def get_cell(position)
    @board_hash[position]
  end

  def assigning_value(position, value)
    @board_hash[position] = value
  end

  private

  def init_hash
    new_hash = {}
    (1..9).each { |i| new_hash[i] = ' ' }
    new_hash
  end
end
