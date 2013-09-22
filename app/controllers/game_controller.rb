gameboard = Board.new(5, 3)
gameboard.print_board
puts ""
gameboard.board[1][0].cat.walk
gameboard.print_board
puts ""
gameboard.board[1][1].cat.walk
gameboard.print_board
puts ""
gameboard.board[1][2].cat.walk
gameboard.print_board
puts ""
gameboard.board[1][3].cat.walk
gameboard.print_board
puts ""
gameboard.board[1][3].cat.rotate(:right)
gameboard.board[1][3].cat.walk
gameboard.print_board
puts ""
gameboard.board[2][3].cat.rotate(:left)
gameboard.board[2][3].cat.walk
gameboard.print_board
puts ""
gameboard.board[2][4].cat.rotate(:left)
gameboard.board[2][4].cat.attack
gameboard.print_board
puts ""


