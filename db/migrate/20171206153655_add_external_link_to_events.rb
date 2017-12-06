class AddExternalLinkToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :external_link, :string
  end
end
