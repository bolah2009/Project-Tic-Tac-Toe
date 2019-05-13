load './lib/board.rb'
load './lib/game.rb'
load './lib/player.rb'

RSpec.describe Game do
  let(:board) { Board.new }
  let(:p1) {  Player.new('A', 'X', board) }
  let(:p2) { Player.new('B', 'O', board) }
  let(:game) { Game.new(p1, p2, board) }

  describe '#victory?' do
    context 'when same values are on horizontal lines' do
      it 'returns true for first horizontal line' do
        board.board = ['X', 'X', 'X', nil, nil, nil, nil, nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns true for second horizontal line' do
        board.board = [nil, nil, nil, 'X', 'X', 'X', nil, nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns true for third horizontal line' do
        board.board = [nil, nil, nil, nil, nil, nil, 'X', 'X', 'X']
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns false if no horizontal line is filled with same value' do
        board.board = [nil, nil, nil, nil, nil, nil, 'X', 'X', 'O']
        expect(game.send(:victory?)).to eql(false)
      end
    end

    context 'when same values are on vertical lines' do
      it 'returns true for first vertical line' do
        board.board = ['X', nil, nil, 'X', nil, nil, 'X', nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns true for second vertical line' do
        board.board = [nil, 'X', nil, nil, 'X', nil, nil, 'X', nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns true for third vertical line' do
        board.board = [nil, nil, 'X', nil, nil, 'X', nil, nil, 'X']
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns false if no vertical line is filled with same value' do
        board.board = [nil, nil, 'X', nil, nil, 'O', nil, nil, 'X']
        expect(game.send(:victory?)).to eql(false)
      end
    end

    context 'when same values are on diagonal lines' do
      it 'returns true for first diagonal line' do
        board.board = [nil, nil, 'X', nil, 'X', nil, 'X', nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns true for second diagonal line' do
        board.board = ['X', nil, nil, nil, 'X', nil, nil, nil, 'X']
        expect(game.send(:victory?)).to eql(true)
      end

      it 'returns false if no diagonal line is filled with same value' do
        board.board = ['X', nil, nil, nil, 'O', nil, nil, nil, 'X']
        expect(game.send(:victory?)).to eql(false)
      end
    end
  end

  describe '#draw?' do
    context 'when the board is full' do
      it 'returns true when all values a filled up' do
        board.board = %w[O O X O X X X O X]
        expect(game.send(:draw?)).to eql(true)
      end

      it 'returns false when all values not filled up' do
        board.board = ['O', 'O', nil, 'O', 'X', nil, 'X', 'O', nil]
        expect(game.send(:draw?)).to eql(false)
      end
    end
  end

  describe '#switch_player' do
    context 'when switch player is called' do
      it 'change the current player for the next one' do
        expect(game.send(:switch_player)).to eql(p2)
      end
    end
  end
end
