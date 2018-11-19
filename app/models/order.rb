class Order < ApplicationRecord
  belongs_to :user
  belongs_to :laundromat

  validates :pick_up_time, :delivery_time, presence: true
  validates :delivery_time_after_pick_up_time

  private

  def delivery_time_after_pick_up_time
    errors.add(:delivery_time, 'must be after pick_up_time') if delivery_time <= pick_up_time
  end

end
