class AddLocationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location, :string, default: "Leicester Square, London"
    add_column :users, :distance, :integer, default: 2

  end
end
