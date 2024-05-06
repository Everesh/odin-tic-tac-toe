class TicTacToe

  def attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
  end

  def print_state
    puts "+---+---+---+"
    puts "| #{board[0][0]} | #{board[0][1]} | #{board[0][2]} |"
    puts "+---+---+---+"
    puts "| #{board[1][0]} | #{board[1][1]} | #{board[1][2]} |"
    puts "+---+---+---+"
    puts "| #{board[2][0]} | #{board[2][1]} | #{board[2][2]} |"
    puts "+---+---+---+"
  end

end

