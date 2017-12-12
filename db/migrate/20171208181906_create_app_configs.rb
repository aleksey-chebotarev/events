class CreateAppConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :app_configs do |t|
      t.integer :number_of_upcoming_days, default: 1, null: false

      t.timestamps
    end
  end
end
