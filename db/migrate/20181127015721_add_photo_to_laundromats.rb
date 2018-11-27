class AddPhotoToLaundromats < ActiveRecord::Migration[5.2]
  def change
    add_column :laundromats, :photo, :string
  end
end
