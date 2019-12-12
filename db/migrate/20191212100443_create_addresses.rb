class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postcode
      t.string :place
      t.string :place_building
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
