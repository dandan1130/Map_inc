class ChangeDateUsersToAdmin < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :admin, :boolean
  end
end
