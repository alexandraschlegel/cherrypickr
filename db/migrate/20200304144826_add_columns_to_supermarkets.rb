class AddColumnsToSupermarkets < ActiveRecord::Migration[6.0]
  def change
    add_column :supermarkets, :website, :string
  end
end
