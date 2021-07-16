class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  before_validation :set_price
  validates :start_date, :end_date, presence: true

  def set_price
    days = end_date.to_date - start_date.to_date
    self.total_price = days * plant.price_per_day
  end

  def accept
    self.status = "accepted"
  end

  def refuse
    self.status = "refused"
  end
end
