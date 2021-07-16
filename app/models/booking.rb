class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  before_validation :set_price
  validates :start_date, :end_date, presence: true

  def set_price
    self.total_days = (end_date.to_date - start_date.to_date).to_i
    self.total_price = total_days * plant.price_per_day
  end

  def accept
    self.status = "Accepted"
  end

  def refuse
    self.status = "Refused"
  end
end
