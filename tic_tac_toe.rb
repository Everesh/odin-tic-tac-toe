class TicTacToe

  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def print_state
    acc = ""
    board.each do | row |
        acc += "+---+---+---+\n"
        acc += "| #{row[0]} | #{row[1]} | #{row[2]} |\n"
    end
    puts acc + "+---+---+---+"
  end

end