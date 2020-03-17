class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :phone_number
      t.integer :password_digest
      t.integer :admin

      t.timestamps
    end
  end
end
