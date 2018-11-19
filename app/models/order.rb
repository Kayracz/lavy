class Order < ApplicationRecord
  belongs_to :user
  belongs_to :laundromat
  monetize :amount_cents
end
