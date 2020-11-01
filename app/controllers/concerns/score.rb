module Score
  extend ActiveSupport::Concern
  def dice
    @rand = rand(2..12)
    @game = Game.find(session[:game_id])
    @score = @game.scorecards
    @scorecard = @score.new(dice: @rand, player_id: player_id)
    steps if @scorecard.save
  end

  def score_card
    @game = Game.find(session[:game_id])
    @score_card = @game.scorecards.includes(:player)
  end

  private

  def player_id
    @player_id = @score.blank? ? @game.players.first.id : @score.last.player.next_player_id
  end

  def steps
    @player_steps = @score.player_steps(@player_id)
    @step = @game.steps.stage(@player_steps)
  end
end