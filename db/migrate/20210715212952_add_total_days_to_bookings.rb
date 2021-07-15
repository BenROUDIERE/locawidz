class AddTotalDaysToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :total_days, :integer
  end
end
