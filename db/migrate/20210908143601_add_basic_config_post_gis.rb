class AddBasicConfigPostGis < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
     SELECT AddGeometryColumn('restaurants', 'geom', 4326, 'POINT', 2);
    SQL
  end
end
