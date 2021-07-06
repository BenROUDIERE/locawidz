class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  enum sun: {ombre: 1, peu_ensoleille: 2, ensoleille: 3}
end
