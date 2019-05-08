load 'lib/board.rb'
load 'lib/player.rb'
load 'lib/game.rb'

board = Board.new
player1 = Player.new('Thor', 'X', board)
player2 = Player.new('Hulk', 'O', board)
tictactoe = Game.new(player1, player2, board)
tictactoe.play_game
