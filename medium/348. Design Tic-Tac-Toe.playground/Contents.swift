
//https://leetcode.com/problems/design-tic-tac-toe/

/*
 
 Design a Tic-tac-toe game that is played between two players on a n x n grid.
 
 You may assume the following rules:
 
 A move is guaranteed to be valid and is placed on an empty block.
 Once a winning condition is reached, no more moves is allowed.
 A player who succeeds in placing n of their marks in a horizontal, vertical, or diagonal row wins the game.
 Example:
 
 Given n = 3, assume that player 1 is "X" and player 2 is "O" in the board.
 
 TicTacToe toe = new TicTacToe(3);
 
 toe.move(0, 0, 1); -> Returns 0 (no one wins)
 |X| | |
 | | | |    // Player 1 makes a move at (0, 0).
 | | | |
 
 toe.move(0, 2, 2); -> Returns 0 (no one wins)
 |X| |O|
 | | | |    // Player 2 makes a move at (0, 2).
 | | | |
 
 toe.move(2, 2, 1); -> Returns 0 (no one wins)
 |X| |O|
 | | | |    // Player 1 makes a move at (2, 2).
 | | |X|
 
 toe.move(1, 1, 2); -> Returns 0 (no one wins)
 |X| |O|
 | |O| |    // Player 2 makes a move at (1, 1).
 | | |X|
 
 toe.move(2, 0, 1); -> Returns 0 (no one wins)
 |X| |O|
 | |O| |    // Player 1 makes a move at (2, 0).
 |X| |X|
 
 toe.move(1, 0, 2); -> Returns 0 (no one wins)
 |X| |O|
 |O|O| |    // Player 2 makes a move at (1, 0).
 |X| |X|
 
 toe.move(2, 1, 1); -> Returns 1 (player 1 wins)
 |X| |O|
 |O|O| |    // Player 1 makes a move at (2, 1).
 |X|X|X|
 Follow up:
 Could you do better than O(n2) per move() operation?
 */

/********************
 
 Steps
 
 1. if player is 1 then r[i]++ c[j]++ else r[i]-- c[j]--
 2. i == j dial1 += 1 if player 1 otherwise dial1 -= 1
 3. i + j = length - 1 dial1 += 1 if player 1 otherwise dial1 -= 1
 4. r[i] == length or c[j] == length or dia1 == length or dia2 == length return 1
 5. r[i] ==  - length or c[j] == - length or dia1 == - length or dia2 == - length return 2
 6. return 0
 
 
*/



class TicTacToe {
    
    var row : [Int]
    var col : [Int]
    var dia1 = 0
    var dia2 = 0
    var length = 0
    /** Initialize your data structure here. */
    init(_ n: Int) {
        
        row = [Int](repeating:0, count : n)
        col = [Int](repeating:0, count : n)
        dia1 = 0
        dia2 = 0
        length = n
    }
    
    /** Player {player} makes a move at ({row}, {col}).
     @param row The row of the board.
     @param col The column of the board.
     @param player The player, can be either 1 or 2.
     @return The current winning condition, can be either:
     0: No one wins.
     1: Player 1 wins.
     2: Player 2 wins. */
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        
        if player == 1 {
            self.row[row] = self.row[row] + 1
            self.col[col] = self.col[col] + 1
        } else {
            self.row[row] = self.row[row] - 1
            self.col[col] = self.col[col] - 1
        }
        
        if row == col {
            dia1 += player == 1 ? 1 : -1
        }
        if row + col == length - 1 {
            dia2 += player == 1 ? 1 : -1
        }
        
        if self.row [row] == length || self.col[col] == length || dia1 == length || dia2 == length {
            return 1
        }
        
        if self.row[row] == -length || self.col[col] == -length || dia1 == -length || dia2 == -length {
            return 2
        }
        
        
        return 0
    }
}

/**
 * Your TicTacToe object will be instantiated and called as such:
 * let obj = TicTacToe(n)
 * let ret_1: Int = obj.move(row, col, player)
 */
