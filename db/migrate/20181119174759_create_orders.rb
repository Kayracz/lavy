class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :laundromat, foreign_key: true
      t.string :status
      t.datetime :pick_up_time
      t.datetime :delivery_time
      t.string :delivery_address
      t.integer :number_of_bags

      t.timestamps
    end
  end
end
