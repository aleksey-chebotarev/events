class CreateSubscribes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribes do |t|
      t.string :email, null: false

      t.timestamps
    end

    add_index :subscribes, :email, unique: true
  end
end
