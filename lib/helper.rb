# Text module
module Helper
  def welcome_message
    puts "\n\n=========TIC-TAC-TOE========="
    puts "\n\nWelcome to the TIC-TAC-TOE game!"
  end

  def game_start_instructions
    puts "\n\nThe first player is 'Player X'"
    puts "\n\nChoose numbers from 1 to 9 to select desired cell."
    puts "\n\nNo duplicate numbers are allowed\n\n"
  end

  def game_end_instructions
    puts "==== GAME END ====\n\n"
    puts "To play again run 'ruby bin/tictactoe.rb'\n"
  end

  def player_win(current_player)
    puts "Player #{current_player} won"
  end

  def player_draw
    puts "It's a draw"
  end

  def player_status(current_player)
    puts "Player #{current_player} is the next to play! Make your move."
  end

  def player_warning_int
    puts "Wrong type of input \n Please select an integer between 1 and 9"
  end

  LINES = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ].freeze

  def board(hash)
    puts "\n\n-------------\n| #{hash[1]} | #{hash[2]} | #{hash[3]} |"
    puts "-------------\n| #{hash[4]} | #{hash[5]} | #{hash[6]} |"
    puts "-------------\n| #{hash[7]} | #{hash[8]} | #{hash[9]} |"
    puts "-------------\n\n"
  end
end
