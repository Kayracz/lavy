class Laundromat < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders 
  has_many :reviews, through: :orders
  monetize :price_cents
end
