class TicTacToe

  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
    brain
  end

  private

  def print_state
    acc = "    1   2   3\n"
    acc += "  +---+---+---+\n"
    board.each.with_index do | row, index |
        acc += "#{index+1} | #{row[0]} | #{row[1]} | #{row[2]} |\n"
        acc += "  +---+---+---+\n"
    end
    puts acc
  end

  def player_input(player)

    puts "May the honorable sir #{player} approach the table!"

    begin
      puts "What ROW do you wish to challenge?"
      row = Integer(gets())
      raise RangeError if row < 1 || row > 3
    rescue RangeError
      puts "What a cheat. Stay within the bounds you scoundrel!"
      puts "\nLets try this again"
      retry
    rescue ArgumentError
      puts "Blasphemer! Digit, give us a digit!"
      puts "\nLets try this again"
      retry
    end

    begin
      puts "What COLUMN do you wish to challenge?"
      column = Integer(gets())
      raise RangeError if column < 1 || column > 3
    rescue RangeError
      puts "What a cheat. Stay within the bounds you scoundrel!"
      puts "\nLets try this again"
      retry
    rescue ArgumentError
      puts "Blasphemer! Digit, give us a digit!"
      puts "\nLets try this again"
      retry
    end

    if board[row-1][column-1] == " "
        if player == "Cross"
            board[row-1][column-1] = "X"
        else
            board[row-1][column-1] = "O"
        end
    else
        puts "Thou can't change whats done!"
        player_input(player)
    end
  end

  def brain
    puts "\nTwo challengers dare to approach the colloseum of Tic of the Toe? The Tac?"
    puts "Very well. Let the duel begin!"
    print_state
    for i in 0..8
      i.even? ? player_input("Cross") : player_input("Circle")
      print_state
      if i > 3
        if winner?
          i.even? ? winner = "CROSS" : winner = "CIRCLE"
          puts "SIRE #{winner} IS OUR VICTOR"
          puts "Please collect yours head of thy enemy"
        end
      end
    end
    puts "Look like a tie my good sirs!" if !winner?
    puts "Care for a rematch? [y/N]"
    brain if gets().chr.downcase == "y"
  end

end

game = TicTacToe.new