class Hotel < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :step
end
