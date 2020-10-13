# Class represent a cell in a chess board. The nodes are for knight moves.
# (x,y):  indicate the position im the board.
# dis: distance from the original position of the knight.
# parent: cell from the knight come.
# child: cell to the knight go.

class Node
    attr_accessor :x, :y, :dis, :parent, :child
    def initialize (x, y, dis,parent = nil, child = nil)
        @x = x
        @y = y
        @dis = dis
        @parent = parent
        @child = child
    end
end