class Laundromat < ApplicationRecord
  has_many :users
  has_many :reviews, through: :orders
end
