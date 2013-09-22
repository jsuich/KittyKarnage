
class Cat

  def initialize(node, orientation)
    @node = node
    @coordinates = node.coordinates
    @orientation = orientation
  end

  def rotate(direction)
    if direction == :left
      if @orientation == 1
        @orientation = 4
      else
        @orientation -= 1
      end
    end

    if direction == :right
      if @orientation == 4
        @orientation = 1
      else
        @orientation += 1
      end
    end
  end

  def walk
    @node.cat = nil
    if @orientation == 1
      @node = @board[@coordinates.first][@coordinates.last + 1]
    elsif @orientation == 2
      @node = @board[@coordinates.first]
      @node.cat = self



  end

  def attack
  end

  def sleep
  end

end

class Node
  
  attr_accessor :contains_cat, :cat

  def initialize(coordinates)
    @coordinates = coordinates
    @cat = nil
  end

end

class Board

  def initialize(width, height)
    @width = width
    @height = height
    create_board
    initialize_cats
  end

  def create_board
    @board = Array.new(@height) {|array| array = Array.new}
    @board.each_with_index do |row, x_coordinate|
      @width.times do |y_coordinate|
        row << Node.new([x_coordinate, y_coordinate])
      end
    end
  
  end

  def initialize_cats
    @board[1][0].cat = New.cat(@board[1][0], 1)
    @board[1][4].cat = New.cat(@board[1][4], 1)
  end

end


p Board.new(5,3)





