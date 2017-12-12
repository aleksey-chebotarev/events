class RenameSubscribesTableToSubscribersTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :subscribes, :subscribers
  end
end
