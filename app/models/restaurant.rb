class Restaurant < ApplicationRecord
  validates :rating, :inclusion => 0..4
  validates :email , uniqueness: { case_sensetive: false }, format:{ with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, multiline:true}
end
