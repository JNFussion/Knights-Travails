require_relative 'node'
require 'pry'


# Class that represent the moves of a knight in a chess board.

class KnightsTravails

    @@BOARD_SIZE = 8
    @@POSSIBLE_MOVES = [[1,2],[2,1],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]

    # Find minimum steps to reach to specific point in minimum moves by Knight.
    # Print the number of steps and the path.

    def self.knight_moves(src, dest)
        node = generate_knight_moves(src, dest)
        puts "You made it in #{node.dis} moves!     Here's your path:"
        path(node).each { |cordenates| p cordenates}
    end
    
    
    private

    #Return an array of the path from the origin point to the destination point.

    def self.path(node)
        arr = []
        until node.nil?
            arr.unshift([node.x, node.y])
            node = node.parent
        end
        arr
    end
    
    # Check if the cordenates are inside the board.

    def self.valid_mode?(x, y)
        return x.between?(0, @@BOARD_SIZE-1) && y.between?(0, @@BOARD_SIZE-1)
    end

    # Return the node of the destination point.

    def self.generate_knight_moves(src, dest)
        
        # queue for storing states of knight in board 
        # push starting position of knight with 0 distance

        queue = []
        queue.push(Node.new(src[0], src[1], 0))

        # Create and bolean array to all the position in the board.
        # And visit the starting position. 
        visit = Array.new(@@BOARD_SIZE){Array.new(@@BOARD_SIZE, false)}
        visit[src[0]][src[1]] = true

        x = 0
        y = 0
    
        until(queue.empty?)
            node = queue.shift
            node.child = node

            return node if node.x == dest[0] && node.y == dest[1]

            # loop for all reachable states 
            @@BOARD_SIZE.times do |index|
                x = node.x + @@POSSIBLE_MOVES[index][0]
                y = node.y + @@POSSIBLE_MOVES[index][1]
                
                # If reachable state is not yet visited and 
                #inside board, push that state into queue 
                if valid_mode?(x, y) && !visit[x][y]
                    visit[x][y] = true
                    queue.push(Node.new(x, y, node.dis + 1, node))
                end
            end
            
        end
        
    end
end

KnightsTravails.knight_moves([3,3], [4,3])