
class TicTacToe
  
  @@WIN_COMBOS = [
    [0,1,2],[0,3,6],[0,4,8],
    [1,4,7],[2,5,8],[3,4,5],
    [6,7,8],[2,4,6]
  ]
  @@board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  
  @@divider = "---+---+---"
  
  #Function to display board 
  
  def display_board
    puts "Available Spaces"
    puts " #{@@board[6] == ' ' ? 7 : ' '} | #{@@board[7] == ' ' ? 8 : ' '} | #{@@board[8] == ' ' ? 9 : ' '}\n#{@@divider}\n #{@@board[3] == ' ' ? 4 : ' '} | #{@@board[4] == ' ' ? 5 : ' '} | #{@@board[5] == ' ' ? 6 : ' '}\n#{@@divider}\n #{@@board[0] == ' ' ? 1 : ' '} | #{@@board[1] == ' ' ? 2 : ' '} | #{@@board[2] == ' ' ? 3 : ' '}"
    puts "Active Board"
    puts " #{@@board[6]} | #{@@board[7]} | #{@@board[8]}\n#{@@divider}\n #{@@board[3]} | #{@@board[4]} | #{@@board[5]}\n#{@@divider}\n #{@@board[0]} | #{@@board[1]} | #{@@board[2]}"
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @@board[index] = token
  end

  def position_taken?(index)
    @@board[index] != " "
  end

  #Replacement for check_input
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

#Loop for tracking turns and game
  def turn_tracker
  @@board.count{|cell| cell != ' '}
end


  def current_player
    turn_tracker.even? ? "X" : "O"
  end

  def turn
    puts "Please select a position 1-9: "
    display_board
    index = input_to_index(gets.chomp)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end  
  end

  def won?
    @@WIN_COMBOS.any? do |combo|
        x, y, z = combo
        if position_taken?(combo[0]) && @@board[combo[0]] == @@board[combo[1]] && @@board[combo[1]] == @@board[combo[2]]
          return combo
      end
    end
  end  

  def full?
    @@board.all?{ |cell| cell != ' '}
  end

  def tie?
    full? && !won?
  end

  def over?
    won? || tie?
  end

  def winner
    if winning_combo = won?
      return @@board[winning_combo[0]]
    end
  end

  def play 
    turn until over?
    puts winner ? "#{winner} has won!" : "Tie!" 
  end  


end

newGame = TicTacToe.new

newGame.play
  