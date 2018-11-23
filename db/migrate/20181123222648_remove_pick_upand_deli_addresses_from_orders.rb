class RemovePickUpandDeliAddressesFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :pick_up_address, :string
    remove_column :orders, :delivery_address, :string
  end
end
