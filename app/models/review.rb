class Review < ApplicationRecord
  belongs_to :order
  validates :description, length: { minimum: 5}
end
