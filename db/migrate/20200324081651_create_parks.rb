class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.string :park_title
      t.string :park_address
      t.text :park_discription
      t.string :park_phone_number
      t.string :station
      t.float:latitude
      t.float:longitude
      t.string :park_image
      t.string :park_url
      t.boolean :park_admin

      t.timestamps
    end
  end
end
