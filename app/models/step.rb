class Step < ApplicationRecord
  belongs_to :game
  has_one :hotel
  after_save :add_hotel
#  before_save :sort_steps

  def sort_steps
    self.steps = self.steps.match(/[EJTH]/i)
  end

  def self.stage(total)
    all[total % all.count]
  end

  def title=(title)
    write_attribute(:title, title.downcase)
  end

  def add_hotel
    self.create_hotel if self.title == 'h'
  end

  def points(player_id)
    case self.title.to_sym
      when :j
        -150
      when :t
        200
      when :h
        self.hotel.player_id == player_id ? 0 : -50
      else
        0
    end
  end
end
