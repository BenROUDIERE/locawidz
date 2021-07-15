class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  geocoded_by :address
end
