class Laundromat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :users
  has_many :orders
  has_many :reviews, through: :orders
  validates :name, :address, :phone_number, :bags_per_day, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  monetize :price_cents
end
