class AddFieldsToSupermarket < ActiveRecord::Migration[6.0]
  def change
    add_column :supermarkets, :address, :string
    add_column :supermarkets, :latitude, :float
    add_column :supermarkets, :longitude, :float
  end
end
