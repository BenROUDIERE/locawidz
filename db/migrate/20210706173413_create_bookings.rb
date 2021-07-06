class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :total_price
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
