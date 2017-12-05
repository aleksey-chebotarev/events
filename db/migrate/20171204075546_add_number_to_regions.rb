class AddNumberToRegions < ActiveRecord::Migration[5.1]
  def change
    add_column :regions, :number, :integer, null: false
    add_index :regions, :number, unique: true
  end
end
