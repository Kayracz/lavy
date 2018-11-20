class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :role, :boolean
    add_column :users, :address, :string
    add_reference :users, :laundromat, index: true
  end
end

