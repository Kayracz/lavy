class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :boats
  # has_many :bookings
  # has_many :rented_boats, through: :bookings, source: :boat

  # validates :first_name, :last_name, presence: true

  # has_many :reviews do we need this, we would need to add through orders?

  has_many :orders
  has_many :orders_to_pick_up, class_name: "Order", foreign_key: "pick_up_guy_id"
  has_many :orders_to_deliver, class_name: "Order", foreign_key: "delivery_guy_id"


  validates :name, :address, presence: true
  validates :name, uniqueness: true

  mount_uploader :photo, PhotoUploader # copied this line from boat model
end
