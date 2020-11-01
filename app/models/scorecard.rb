class Scorecard < ApplicationRecord
  belongs_to :player
  default_scope { order(:created_at) }
  scope :by_game, -> (game_id) {where(game_id: game_id)}
  scope :player_steps, ->(player_id) {where(player_id: player_id).sum(:dice)}
end
