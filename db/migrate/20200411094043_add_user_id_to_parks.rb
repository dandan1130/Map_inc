class AddUserIdToParks < ActiveRecord::Migration[5.0]
  def change
    add_reference :parks, :user, foreign_key: true
  end
end
