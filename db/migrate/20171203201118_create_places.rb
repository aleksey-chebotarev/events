class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :title, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
