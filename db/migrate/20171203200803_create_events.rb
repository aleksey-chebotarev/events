class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :cover
      t.datetime :start_date, null: false
      t.integer :region_id, null: false
      t.integer :city_id, null: false
      t.integer :organizer_id, null: false
      t.integer :place_id, null: false

      t.timestamps
    end

    add_index :events, :start_date
    add_index :events, :region_id
    add_index :events, :city_id
    add_index :events, :organizer_id
    add_index :events, :place_id
  end
end
