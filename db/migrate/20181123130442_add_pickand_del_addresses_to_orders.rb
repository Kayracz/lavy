class AddPickandDelAddressesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pick_up_address, :string
    add_column :orders, :delivery_address, :string
  end
end
