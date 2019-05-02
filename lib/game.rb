require_relative 'board'
# Game Class
class Game
  def initialize
    @new_board = Board.new
    @current_player = ""
    @input_count = 0
    @game_status = -1
    play_game
  end

  def play_game
    while(@game_status == -1)
      display_board
      change_current_player
      display_status
      input = request_player_input
      assign_player_input(input)
      @game_status = check_game_status
    end
    if(@game_status == 1)
      display_board
      puts "Player #{@current_player} won"
    else
      display_board
      puts "It's a draw"
    end
  end

  def display_board
    @new_board.show_board
  end

  def check_game_status
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
        return 1 if(check(i[0]) == 'X' || check(i[0]) == 'O')
      end
    end
    return 0 if(@input_count == 9)
    return -1
  end

  def check(index)
    @new_board.get_cell(index)
  end

  def change_current_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def display_status
    puts "Player #{@current_player} is the next to play! Make your move."
  end

  def request_player_input
    input = gets.chomp.to_i
    until is_valid_input(input)
      input = gets.chomp.to_i
    end
    input
  end

  def assign_player_input(position)
    @new_board.assigning_value(position, @current_player)
    @input_count += 1
  end

  def is_valid_input(input)
    if((input.is_a? Integer) && (input > 0 && input < 10))
      if(check(input) == ' ')
        return true
      else
        puts "Please select an available position instead"
      end
    else
      puts "Wrong type of input"
      puts "Please select an integer between 1 and 9"
    end
    return false
  end
end

game = Game.new
