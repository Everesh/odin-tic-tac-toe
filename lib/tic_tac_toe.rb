class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def play
    brain
  end

  private

  attr_accessor :board

  class RowFullError < ::StandardError
  end

  def print_state
    acc = "\n    1   2   3\n"
    acc += "  +---+---+---+\n"
    board.each.with_index do |row, index|
      acc += "#{index + 1} | #{row[0]} | #{row[1]} | #{row[2]} |\n"
      acc += "  +---+---+---+\n"
    end
    acc += "\n"
    puts acc
  end

  def row_full?(row)
    return false if board[row].any? { |space| space == ' ' }

    true
  end

  def player_input(player)
    begin
      puts 'What ROW do you wish to challenge?'
      row = Integer(gets)
      raise RangeError if row < 1 || row > 3
      raise RowFullError if row_full?(row - 1)
    rescue RangeError
      puts '### What a cheat. Stay within the bounds you scoundrel!'
      retry
    rescue ArgumentError
      puts '### Blasphemer! Digit, give us a digit!'
      retry
    rescue RowFullError
      puts '### Im afraid that ROW is way too crowded, choose another!'
      retry
    end

    begin
      puts 'What COLUMN do you wish to challenge?'
      column = Integer(gets)
      raise RangeError if column < 1 || column > 3
    rescue RangeError
      puts '### What a cheat. Stay within the bounds you scoundrel!'
      retry
    rescue ArgumentError
      puts '### Blasphemer! Digit, give us a digit!'
      retry
    end

    if board[row - 1][column - 1] == ' '
      board[row - 1][column - 1] = if player == 'Cross'
                                     'X'
                                   else
                                     'O'
                                   end
    else
      puts "### Thou can't change whats done!"
      player_input(player)
    end
  end

  def winner?
    return true if board.any? { |row| row[0] == row[1] && row[1] == row[2] && row[0] != ' ' }
    return true if board.transpose.any? { |row| row[0] == row[1] && row[1] == row[2] && row[0] != ' ' }
    return true if board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[1][1] != ' '
    return true if board[2][0] == board[1][1] && board[1][1] == board[0][2] && board[1][1] != ' '

    false
  end

  def brain
    puts "\nTwo challengers dare to approach the colloseum of Tic of the Toe? The Tac?"
    puts 'Very well. Let the duel begin!'
    print_state
    for i in 0..8
      player = i.even? ? 'Cross' : 'Circle'
      puts "May the honorable sir #{player} approach the table!"
      player_input(player)
      print_state
      next unless i > 3 && winner?

      winner = i.even? ? 'CROSS' : 'CIRCLE'
      puts "SIRE #{winner} IS OUR VICTOR"
      puts 'Please collect the head of thy enemy'
      break
    end
    puts 'Look like a tie my good sirs!' unless winner?
    puts 'Care for a rematch? [y/N]'
    initialize if gets.chr.downcase == 'y'
  end
end

TicTacToe.new
