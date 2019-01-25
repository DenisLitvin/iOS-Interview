import Foundation

/*
 There is a brick wall in front of you. The wall is rectangular and has several rows of bricks. The bricks have the same height but different width. You want to draw a vertical line from the top to the bottom and cross the least bricks.
 
 The brick wall is represented by a list of rows. Each row is a list of integers representing the width of each brick in this row from left to right.
 
 If your line go through the edge of a brick, then the brick is not considered as crossed. You need to find out how to draw the line to cross the least bricks and return the number of crossed bricks.
 
 You cannot draw a line just along one of the two vertical edges of the wall, in which case the line will obviously cross no bricks.
 */

func leastBricks(_ wall: [[Int]]) -> Int {
    guard wall.count > 0 else { return 0 }
    var offsetsWithHoles = Array(repeating: 0, count: 1000)
    for row in wall {
        var offset = 0
        for brick in row.dropLast() {
            offset += brick
            offsetsWithHoles[offset] += 1
        }
    }
    return wall.count - offsetsWithHoles.max()!
}

let wall = [[1,2,2,1],
            [3,1,2],
            [1,3,2],
            [2,4],
            [3,1,2],
            [1,3,1,1]]
leastBricks(wall)
