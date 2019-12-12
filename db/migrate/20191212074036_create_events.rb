class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :start, null: false
      t.date :end
      t.text :url
      t.integer :category_id, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
