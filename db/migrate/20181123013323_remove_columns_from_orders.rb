class RemoveColumnsFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :delivery_address, :string
    remove_column :orders, :pick_up_address, :string
    remove_column :orders, :pick_up_latitude, :string
    remove_column :orders, :pick_up_longitude, :string
    remove_column :orders, :delivery_latitude, :string
    remove_column :orders, :delivery_longitude, :string
  end
end
