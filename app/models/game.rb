class Game < ApplicationRecord
  has_many :players, inverse_of: :game
  has_many :scorecards
  has_many :steps
  accepts_nested_attributes_for :players, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :steps, presence: true
  #before_save :sort_steps

  def sort_steps
    self.steps = self.steps.downcase.scan(/[EJTH]/i).join
  end
end
