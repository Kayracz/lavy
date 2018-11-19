class AddPriceToLaundromats < ActiveRecord::Migration[5.2]
  def change
    add_monetize :laundromats, :price, currency: { present: false }
  end
end
