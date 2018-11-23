class AddCoordinatesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pick_up_latitude, :float
    add_column :orders, :pick_up_longitude, :float
    add_column :orders, :delivery_latitude, :float
    add_column :orders, :delivery_longitude, :float
  end
end
