WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts ("-----------")
  puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts ("-----------")
  puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
end

def input_to_index(input)
  user_input = input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] == " " || board[index] == "" || board[index] == nil ? false : true
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0,8) ? true : false
end

def turn(board)
  puts "Choose a number 1-9: "
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "That position is already taken"
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each { |space|
    if space == "X" || space == "O"
      counter += 1
    end
  }
    return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end
