class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :region_id, null: false

      t.timestamps
    end

    add_index :cities, :name, unique: true
    add_index :cities, :region_id
  end
end
