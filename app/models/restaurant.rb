class Restaurant < ApplicationRecord
  validates :rating, :inclusion => 0..4
end
