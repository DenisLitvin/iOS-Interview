import Foundation

/*
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
 
 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 
 Example:
 
 X X X X
 X O O X
 X X O X
 X O X X
 After running your function, the board should be:
 
 X X X X
 X X X X
 X X X X
 X O X X
 Explanation:
 
 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 */

func solve(_ board: inout [[Character]]) {
    if board.count == 0 { return }
    var visited = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
    solveHelper(&board, visited: &visited)
}

func solveHelper(_ board: inout [[Character]], visited: inout [[Int]]) {
    for row in 0 ..< board.count {
        for column in 0 ..< board[row].count {
            if  row > 0,
                row < board.count - 1,
                column > 0,
                column < board[row].count - 1
            {
                continue
            }
            findAdjacent(row: row, column: column, board: &board, visited: &visited)
        }
    }
    for row in 0 ..< board.count {
        for column in 0 ..< board[row].count {
            if visited[row][column] == 0 {
                board[row][column] = "X"
            }
        }
    }
}
func findAdjacent(row: Int, column: Int, board: inout [[Character]], visited: inout [[Int]]) {
    guard row >= 0, row < board.count else { return }
    guard column >= 0, column < board[row].count else { return }
    
    if  board[row][column] == "O",
        visited[row][column] == 0
    {
        visited[row][column] = 1
        //up
        findAdjacent(row: row - 1, column: column, board: &board, visited: &visited)
        //left
        findAdjacent(row: row, column: column - 1, board: &board, visited: &visited)
        //right
        findAdjacent(row: row, column: column + 1, board: &board, visited: &visited)
        //down
        findAdjacent(row: row + 1, column: column, board: &board, visited: &visited)
    }
}
var board: [[Character]] = [["X","O","X","O","X","O"],["O","X","O","X","O","X"],["X","O","X","O","X","O"],["O","X","O","X","O","X"]]

solve(&board)
