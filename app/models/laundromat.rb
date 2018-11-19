class Laundromat < ApplicationRecord
  has_many :users
  has_many :reviews, through: :orders
  validates :name, :address, :phone_number, :bags_per_day, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  has_many :orders
  monetize :price_cents
end
