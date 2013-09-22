class ActionsController < ApplicationController
  def actions 
    params --> action[:move_sequence] = [right, up, right, 1, fire]

    @player_one = 
    @player_two = 

    render 'boards/show'
  end
end
