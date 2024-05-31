require_relative '../lib/tic_tac_toe'

describe TicTacToe do
  subject(:game) { described_class.new }

  describe '#winner?' do
    context 'when 3 in row' do
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
  end
end
