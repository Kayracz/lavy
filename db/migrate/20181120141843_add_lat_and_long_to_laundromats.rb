class AddLatAndLongToLaundromats < ActiveRecord::Migration[5.2]
  def change
    add_column :laundromats, :lat, :float
    add_column :laundromats, :long, :float
  end
end
