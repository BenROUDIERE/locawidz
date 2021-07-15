class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  before_validation :set_price
  validates :start_date, :end_date, presence: true

  def set_price
    self.days = (end_date - start_date).to_i
    self.price = days * plant.price
  end

  def accept
    self.accepted = "accepted"
  end

  def refuse
    self.accepted = "refused"
  end
end
