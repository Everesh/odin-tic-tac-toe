require_relative '../lib/tic_tac_toe'

describe TicTacToe do
  subject(:game) { described_class.new }

  describe '#winner?' do
    context 'when 3 in row' do
      it 'returns true' do
        allow(game).to receive(:board).and_return([[' ', ' ', 'O'],
                                                   ['X', 'X', 'X'],
                                                   ['O', ' ', ' ']])
        expect(game.winner?).to be true
      end
    end
  end
end
