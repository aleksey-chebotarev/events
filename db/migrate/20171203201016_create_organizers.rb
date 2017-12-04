class CreateOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :organizers do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end

    add_index :organizers, :title, unique: true
  end
end
