class ActionsController < ApplicationController
  def new 
    # params --> action[:move_sequence] = [right, up, right, 1, fire]

    render 'board/show'
  end

  def create

  end
end
