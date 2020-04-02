class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.integer :park_id
      t.string :shop_name
      t.string :shop_discription
      t.string :shop_phone_number
      t.string :shop_image
      t.string :floor
      t.string :category

      t.timestamps
    end
    add_index :shops, [:park_id]
  end
end
