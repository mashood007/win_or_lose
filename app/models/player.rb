class Player < ApplicationRecord
  belongs_to :game
  has_many :scorecards
  has_many :steps, through: :game
  has_many :hotels
  def next_player_id
    players = game.players
    begin
      players[players.index(self)+1].id
    rescue
      players.first.id
    end
  end

  def score
    points = 1000 - self.hotels.count * 200
    index = 0
    self.scorecards.each do |card|
      index = index + card.dice
      points += self.steps[index % self.steps.count].points(self.id)
    end
    points
  end

end
