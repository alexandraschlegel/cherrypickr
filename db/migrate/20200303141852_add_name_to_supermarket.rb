class AddNameToSupermarket < ActiveRecord::Migration[6.0]
  def change
    add_column :supermarkets, :name, :string
  end
end
