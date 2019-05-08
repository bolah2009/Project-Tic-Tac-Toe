load './lib/board.rb'
load './lib/game.rb'
load './lib/player.rb'

board = Board.new
p1 = Player.new("A", "X", board)
p2 = Player.new("B", "O", board)
game = Game.new(p1, p2, board)

RSpec.describe Game do
  describe "#game_over?" do
    context "Test horizontal winning cases. Should return true for every test" do
      it do
        board.board = ["X", "X", "X", nil, nil, nil, nil, nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it do
        board.board = [nil, nil, nil, "X", "X", "X", nil, nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it do
        board.board = [nil, nil, nil, nil, nil, nil, "X", "X", "X"]
        expect(game.send(:victory?)).to eql(true)
      end
    end

    context "Test vertical cases. Should return true for every test" do
      it do
        board.board = ["X", nil, nil, "X", nil, nil, "X", nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it do
        board.board = [nil, "X", nil, nil, "X", nil, nil, "X", nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it do
        board.board = [nil, nil, "X", nil, nil, "X", nil, nil, "X"]
        expect(game.send(:victory?)).to eql(true)
      end
    end

    context "Test diagonal cases. Must be true for every case" do
      it do
        board.board = [nil, nil, "X", nil, "X", nil, "X", nil, nil]
        expect(game.send(:victory?)).to eql(true)
      end

      it do
        board.board = ["X", nil, nil, nil, "X", nil, nil, nil, "X"]
        expect(game.send(:victory?)).to eql(true)
      end
    end
  end

  describe "#full?" do
    context "Should return true if the boarder is full" do
      it do
        board.board = ["O", "O", "X", "O", "X", "X", "X", "O", "X"]
        expect(game.send(:draw?)).to eql(true)
      end

      it do
        board.board = ["O", "O", nil, "O", "X", nil, "X", "O", nil]
        expect(game.send(:draw?)).to eql(false)
      end
    end
  end
  describe "#switch_player" do
    context "Should change the current_player for the next one" do
      it { expect(game.send(:switch_player)).to eql(p2) }
    end
  end
end

RSpec.describe Board do
  describe "#valid_position?" do
    context "Should return true if a value was not choosed already" do
      it do
        board.board = ["O", nil, nil, nil, nil, nil, nil, nil, nil]
        expect(board.send(:valid_position?, 0)).to eql(nil)
      end

      it do
        board.board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        expect(board.send(:valid_position?, 0)).to eql(true)
      end
    end
  end

  describe "#assigning_value" do
    context "Returns true if a value was assigned successfully, otherwise false" do
      it do
        board.board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        expect(board.send(:assigning_value, 3, "O")).to eql(true)
        expect(board.board).to match([nil, nil, "O", nil, nil, nil, nil, nil, nil])
      end

      it do
        board.board = [nil, nil, "X", nil, nil, nil, nil, nil, nil]
        expect(board.send(:assigning_value, 3, "O")).to eql(false)
        expect(board.board).to match([nil, nil, "X", nil, nil, nil, nil, nil, nil])
      end
    end
  end
end
