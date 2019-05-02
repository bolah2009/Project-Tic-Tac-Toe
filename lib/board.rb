require_relative 'helper'
# Board class
class Board
  include Helper
  def initialize
    @board_hash = init_hash
  end

  def show_board
    board(@board_hash)
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
