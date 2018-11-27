class Review < ApplicationRecord
  belongs_to :order
  validates :description, length: { minimum: 5 }
  validates :stars, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
