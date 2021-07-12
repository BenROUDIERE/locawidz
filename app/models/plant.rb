class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  #enum sun: {ombre: 1, peu_ensoleille: 2, ensoleille: 3}
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
