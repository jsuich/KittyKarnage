class BoardController < ApplicationController
  def show 
    @player_one_move = "some move" 
    @player_two_move = "some move"

    render 'board/show'
  end
end
