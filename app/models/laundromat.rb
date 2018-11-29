class Laundromat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :users
  has_many :orders
  has_many :reviews, through: :orders
  validates :name, :address, :phone_number, :bags_per_day, :photo, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  monetize :price_cents

  mount_uploader :photo, PhotoUploader # copied this line from boat model

  def stars
    self.reviews.average(:stars) || 0
  end

  def self.minimum_stars(min)
   laundromats = Laundromat.all
   result = []
   laundromats.each do |l|
    if l.stars >= min
      result << l
    end
   end
   result
  end
end
