class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :pick_up_guy, index: true
    add_reference :orders, :delivery_guy, index: true
    add_column :orders, :pick_up_address, :string
  end
end
