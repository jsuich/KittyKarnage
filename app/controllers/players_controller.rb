class PlayersController < ApplicationController
  def show 
    # params --> action[:move_sequence] = [right, up, right, 1, fire]

    @player_one = 2
    @player_two = 2

    render 'board/show'
  end
end
