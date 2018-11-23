class RemoveColumnsFromLaundromats < ActiveRecord::Migration[5.2]
  def change
    remove_column :laundromats, :lat, :float
    remove_column :laundromats, :long, :float
  end
end
