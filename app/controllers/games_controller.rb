class GamesController < ApplicationController
  include Score
  before_action :dashboard, only: [:index]

  def index
    @game = Game.find(session[:game_id])
  end

  def new
    @game = Game.new
    @game.steps.build
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      session[:game_id] = @game.id
      redirect_to games_path
    else
      render :new
    end
  end

  def exit
    session[:game_id] = nil
    redirect_to(new_game_path)
  end

  private

  def game_params
    params.require(:game).permit(:title, steps_attributes: [:id, :title, :_destroy], players_attributes: [:id, :name, :_destroy])
  end

  def dashboard
    redirect_to(new_game_path) if session[:game_id].blank?
  end
end
