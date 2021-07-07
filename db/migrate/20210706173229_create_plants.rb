class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :address
      t.string :name
      t.string :category
      t.integer :price_per_day
      t.text :description
      t.string :orientation
      t.integer :sun
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
