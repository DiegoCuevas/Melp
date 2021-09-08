class Restaurant < ApplicationRecord
  validates :rating, :inclusion => 0..4
  validates :email , uniqueness: { case_sensetive: false }, format:{ with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, multiline:true}

  def self.search(longitude, latitude, radius)
    data = Restaurant.where("ST_DWithin(geom, ST_MakePoint(#{longitude}, #{latitude})::geography, #{radius})")
    avg = data.inject(0.0) { |sum, e| sum + e["rating"] } / data.count
    sum = data.map(&:rating).sum(0.0) { |element| (element - avg) ** 2 }
    variance = sum / (data.count - 1)
    standard_deviation = Math.sqrt(variance)
    {
      count: data.count,
      avg: avg,
      std: standard_deviation,
    }
  end
end
