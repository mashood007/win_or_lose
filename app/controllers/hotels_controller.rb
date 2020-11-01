class HotelsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    if params[:buy] == "yes"
      Hotel.find(params[:id]).update(player_id: params[:player_id])
    end
  end
end
