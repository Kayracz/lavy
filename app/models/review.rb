class Review < ApplicationRecord
  belongs_to :order
  validates :description, presence: true
  validates :stars, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
