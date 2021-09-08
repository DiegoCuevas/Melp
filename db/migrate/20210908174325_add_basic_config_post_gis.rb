class AddBasicConfigPostGis < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      SELECT AddGeometryColumn('restaurants'::VARCHAR, 'geom'::VARCHAR, 4326, 'POINT'::VARCHAR, 2);
      CREATE INDEX idx_restaurants_geom ON restaurants USING gist(geom);
    SQL
  end
end
