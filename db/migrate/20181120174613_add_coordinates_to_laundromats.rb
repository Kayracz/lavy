class AddCoordinatesToLaundromats < ActiveRecord::Migration[5.2]
  def change
    add_column :laundromats, :latitude, :float
    add_column :laundromats, :longitude, :float
  end
end
