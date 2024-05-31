require_relative '../lib/tic_tac_toe'

describe TicTacToe do
  subject(:game) { described_class.new }

  describe '#winner?' do
    context 'when no continuous 3' do
      it 'returns false' do
        allow(game).to receive(:board).and_return([['O', ' ', 'O'],
                                                   ['X', 'X', ' '],
                                                   ['O', 'X', 'X']])
        expect(game.winner?).not_to be true
      end
    end
    context 'when 3 same in row' do
      it 'first row returns true' do
        allow(game).to receive(:board).and_return([['O', 'O', 'O'],
                                                   ['X', 'X', ' '],
                                                   ['O', 'X', 'X']])
        expect(game.winner?).to be true
      end
      it 'second row returns true' do
        allow(game).to receive(:board).and_return([[' ', ' ', 'O'],
                                                   ['X', 'X', 'X'],
                                                   ['O', ' ', ' ']])
        expect(game.winner?).to be true
      end
      it 'third row returns true' do
        allow(game).to receive(:board).and_return([['X', 'X', 'O'],
                                                   ['X', ' ', 'X'],
                                                   ['O', 'O', 'O']])
        expect(game.winner?).to be true
      end
    end
    context 'when 3 same in column' do
      it 'first column returns true' do
        allow(game).to receive(:board).and_return([['O', ' ', 'O'],
                                                   ['O', 'X', 'X'],
                                                   ['O', 'X', 'X']])
        expect(game.winner?).to be true
      end
      it 'second column returns true' do
        allow(game).to receive(:board).and_return([[' ', 'X', 'O'],
                                                   ['X', 'X', 'O'],
                                                   ['O', 'X', ' ']])
        expect(game.winner?).to be true
      end
      it 'third column returns true' do
        allow(game).to receive(:board).and_return([['X', 'X', 'O'],
                                                   ['X', ' ', 'O'],
                                                   ['O', 'X', 'O']])
        expect(game.winner?).to be true
      end
    end
    context 'when 3 same in diagonal' do
      it 'top-left to bottom-right returns true' do
        allow(game).to receive(:board).and_return([['X', ' ', 'O'],
                                                   ['O', 'X', ' '],
                                                   ['O', 'X', 'X']])
        expect(game.winner?).to be true
      end
      it 'bottom-left to top-right returns true' do
        allow(game).to receive(:board).and_return([['X', 'X', 'O'],
                                                   ['X', 'O', 'O'],
                                                   ['O', 'X', ' ']])
        expect(game.winner?).to be true
      end
    end
  end
  subject(:game) { described_class.new }

  describe '#winner?' do
    context 'when 3 same in row' do
      it 'first row returns true' do
        allow(game).to receive(:board).and_return([['O', 'O', 'O'],
                                                   ['X', 'X', ' '],
                                                   ['O', 'X', 'X']])
        expect(game.winner?).to be true
      end
      it 'second row returns true' do
        allow(game).to receive(:board).and_return([[' ', ' ', 'O'],
                                                   ['X', 'X', 'X'],
                                                   ['O', ' ', ' ']])
        expect(game.winner?).to be true
      end
      it 'third row returns true' do
        allow(game).to receive(:board).and_return([['X', 'X', 'O'],
                                                   ['X', ' ', 'X'],
                                                   ['O', 'O', 'O']])
        expect(game.winner?).to be true
      end
    end
    context 'when 3 same in column' do
        it 'first column returns true' do
          allow(game).to receive(:board).and_return([['O', ' ', 'O'],
                                                     ['O', 'X', 'X'],
                                                     ['O', 'X', 'X']])
          expect(game.winner?).to be true
        end
        it 'second column returns true' do
          allow(game).to receive(:board).and_return([[' ', 'X', 'O'],
                                                     ['X', 'X', 'O'],
                                                     ['O', 'X', ' ']])
          expect(game.winner?).to be true
        end
        it 'third column returns true' do
          allow(game).to receive(:board).and_return([['X', 'X', 'O'],
                                                     ['X', ' ', 'O'],
                                                     ['O', 'X', 'O']])
          expect(game.winner?).to be true
        end
      end
  end
end
