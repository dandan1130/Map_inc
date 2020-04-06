class ChangeDataLatitudeToParks < ActiveRecord::Migration[5.0]
  def change
    change_column :parks, :latitude, :float
  end
end
