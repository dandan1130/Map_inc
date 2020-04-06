class ChangeDataLongitudeToParks < ActiveRecord::Migration[5.0]
  def change
  change_column :parks, :longitude, :float
  end
end
