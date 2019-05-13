load './lib/board.rb'
load './lib/game.rb'
load './lib/player.rb'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#valid_position?' do
    context 'when checked for valid positions' do
      it 'returns false if position is already taken' do
        board.board = ['O', nil, nil, nil, nil, nil, nil, nil, nil]
        expect(board.send(:valid_position?, 0)).to eql(false)
      end

      it 'returns true if position is not taken' do
        board.board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        expect(board.send(:valid_position?, 0)).to eql(true)
      end
    end
  end

  describe '#assigning_value' do
    context 'when a value is passed' do
      it 'returns true if successfully assigned' do
        board.board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        expect(board.send(:assigning_value, 3, 'O')).to eql(true)
        expect(board.board).to match([nil, nil, 'O', nil, nil, nil, nil, nil, nil])
      end

      it 'returns false if not successfully assigned' do
        board.board = [nil, nil, 'X', nil, nil, nil, nil, nil, nil]
        expect(board.send(:assigning_value, 3, 'O')).to eql(false)
        expect(board.board).to match([nil, nil, 'X', nil, nil, nil, nil, nil, nil])
      end
    end
  end
end
