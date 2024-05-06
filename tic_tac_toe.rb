class TicTacToe

  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
    puts "\nTwo challengers dare to approach the colloseum of Tic of the Toe? The Tac?"
    puts "Very well. Let the duel begin!"
    print_state
  end

  private

  def print_state
    acc = "\n"
    board.each do | row |
        acc += "+---+---+---+\n"
        acc += "| #{row[0]} | #{row[1]} | #{row[2]} |\n"
    end
    puts acc + "+---+---+---+\n"
  end

end

game = TicTacToe.new #delete this after