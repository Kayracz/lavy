class CreateLaundromats < ActiveRecord::Migration[5.2]
  def change
    create_table :laundromats do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.integer :bags_per_day

      t.timestamps
    end
  end
end
