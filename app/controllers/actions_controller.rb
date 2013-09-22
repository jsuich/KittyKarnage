class ActionsController < ApplicationController
  def new 
    # params --> action[:move_sequence] = [right, up, right, 1, fire]

    render 'board/show'
  end

  def create
  end


private 

class Cat
  def initialize(node, orientation, board)
    @node = node
    @coordinates = node.coordinates
    @orientation = orientation
    @board = board
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
    if @orientation == 1 && @coordinates.last != @board.width-1 && @node.node_to_right.cat == nil
      @node = @node.node_to_right
    elsif @orientation == 2 && @coordinates.first != @board.height-1 && @node.node_below.cat == nil
      @node = @node.node_below
    elsif @orientation == 3 && @coordinates.last != 0 && @node.node_to_left.cat == nil
      @node = @node.node_to_left
    elsif @orientation == 4 && @coordinates.first != 0 && @node.node_above.cat == nil
      @node = @node.node_above
    end

    @coordinates = @node.coordinates
    @node.cat = self

  end

  def attack
    if @orientation == 1 && @coordinates.last != @board.width-1
      if @node.node_to_right.cat != nil
         @node.node_to_right.cat = nil
      end
      if @node.node_to_right.node_to_right != nil && @node.node_to_right.node_to_right.cat != nil
         @node.node_to_right.node_to_right.cat = nil
      end
    elsif @orientation == 2 && @coordinates.first != @board.height-1
      if @node.node_below.cat != nil
         @node.node_below.cat = nil
      end
      if @node.node_below.node_below != nil && @node.node_below.node_below.cat != nil
         @node.node_below.node_below.cat = nil
      end
    elsif @orientation == 3 && @coordinates.last != 0
      if @node.node_to_left.cat != nil
         @node.node_to_left.cat = nil
      end
      if @node.node_to_left.node_to_left != nil && @node.node_to_left.node_to_left.cat != nil
         @node.node_to_left.node_to_left.cat = nil
      end
    elsif @orientation == 4 && @coordinates.first != 0
      if @node.node_above.cat != nil
         @node.node_above.cat = nil
      end
      if @node.node_above.node_above != nil && @node.node_above.node_above.cat != nil
         @node.node_above.node_above.cat = nil
      end
    end
  end

  def sleep
    sleep(1)
  end
end

class Node
  
  attr_accessor :contains_cat, :cat
  attr_reader :coordinates

  def initialize(coordinates, board)
    @board = board
    @coordinates = coordinates
    @cat = nil
  end

  def node_to_right
    @board.board[@coordinates.first][@coordinates.last + 1]
  end

  def node_below
    @board.board[@coordinates.first + 1][@coordinates.last]
  end

  def node_to_left
    @board.board[@coordinates.first][@coordinates.last - 1]
  end

  def node_above
    @board.board[@coordinates.first - 1][@coordinates.last]
  end

end

class Board

  attr_reader :board, :width, :height

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
        row << Node.new([x_coordinate, y_coordinate], self)
      end
    end
  
  end

  def initialize_cats
    @board[1][0].cat = Cat.new(@board[1][0], 1, self)
    @board[1][4].cat = Cat.new(@board[1][4], 1, self)
  end

  def print_board
    @board.each do |row|
      row.each do |node|
        if node.cat == nil
          print " "
        else
          print "@"
        end
        print "|"
      end
      puts ""
    end
  end

end
end
