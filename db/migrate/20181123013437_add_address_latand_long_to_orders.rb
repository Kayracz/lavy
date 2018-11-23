class AddAddressLatandLongToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address, :string
    add_column :orders, :latitude, :float
    add_column :orders, :longitude, :float
  end
end
