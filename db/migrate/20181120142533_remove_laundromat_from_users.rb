class RemoveLaundromatFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :laundromat_id
  end
end
