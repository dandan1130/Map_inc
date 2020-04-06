class Park < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :park_category, :string
  end
end
