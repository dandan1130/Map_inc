class RenameWestColumnToParks < ActiveRecord::Migration[5.0]
  def change
    rename_column :parks, :west, :longitude
  end
end
