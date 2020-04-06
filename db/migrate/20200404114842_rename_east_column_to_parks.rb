class RenameEastColumnToParks < ActiveRecord::Migration[5.0]
  def change
    rename_column :parks, :east, :latitude
  end
end
