require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurantes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Restaurant.new
  t.rating = row['rating']
  t.name = row['name']
  t.site = row['site']
  t.email = row['email']
  t.phone = row['phone']
  t.street = row['street']
  t.city = row['city']
  t.state = row['state']
  t.lat = row['lat']
  t.lng = row['lng']
  t.save
  puts "#{t.name}, #{t.email} saved"
end

ActiveRecord::Base.connection.execute("UPDATE restaurants SET geom = ST_SetSRID(ST_MakePoint(lng, lat), 4326);")
ActiveRecord::Base.connection.execute("CREATE INDEX idx_restaurants_geom ON restaurants USING gist(geom);")
