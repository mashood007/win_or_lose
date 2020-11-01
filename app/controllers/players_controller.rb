class PlayersController < ApplicationController
  def show
    @point = Player.find(params[:id]).score
  end
end
