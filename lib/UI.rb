module UI
  def turns(name, player)
    puts "#{name}(#{player}): It's your turn. Make your move!"
  end

  def error_integer
    puts 'Please insert a number from 1 to 9.'
  end

  def get_input
    gets.chop.to_i
  end

  def get_valid_input
    loop do
    value = get_input
    return value if (1..9).cover?(value)
    error_integer
    end
  end

  def taken_position
    puts 'This position was already taken! Choose another one.'
  end

  def out_of_bounds
    puts 'Position out of bounds'
  end

  def win_message
    puts "Congratulations #{@current_player.name}, you won"
  end

  def draw_message
    puts "Too bad. It's a draw."
  end

  def render_board(board_data)
    puts '-------------'
    board_data.each_slice(3) do |slice|
      print('| ')
      slice.each do |cell|
        cell.nil? ? print('-') : print(cell)
        print(' | ')
      end
      print("\n")
    end
    puts '-------------'
  end
end
