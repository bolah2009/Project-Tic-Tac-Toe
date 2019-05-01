require_relative 'board'
# Game Class
class Game
  def initialize(position)
    @new_board = Board.new
    @is_x = true
    play_game(position)
  end

  def play_game(position)
    player = current_player
    @new_board.assigning_value(position, player)
    display
  end

  private

  def current_player
    @current_player = @is_x ? 'X' : 'O'
  end

  def display
    puts @new_board.show_board
    status
  end

  def status
    player = current_player
    p calculate_winner
    case calculate_winner
    when -1
      @is_x = !@is_x
      puts "Player #{player} is next!"
    when 1
      puts "Player #{player} is the winner!"
      puts 'GAME END'
    else
      puts 'DRAWWWWWWW'
    end
  end

  def check(index)
    @new_board.get_cell(index)
  end

  def calculate_winner
    lines = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
    lines.each do |i|
      if (check(i[0]) == check(i[1])) && (check(i[0]) == check(i[2]))
        return 0 if check(i[0]) == ' '

        return 1
      end
      return -1
    end
  end
end

new_game = Game.new(1)
new_game.play_game(2)
new_game.play_game(3)
new_game.play_game(5)
new_game.play_game(4)
new_game.play_game(7)
new_game.play_game(8)
new_game.play_game(9)
new_game.play_game(6)

new_game.play_game(6)

