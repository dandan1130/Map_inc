class RenameShopPhoneNimberColumnToShops < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :shop_phone_nimber, :shop_phone_number
  end
end
