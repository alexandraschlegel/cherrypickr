class AddImageToSupermarkets < ActiveRecord::Migration[6.0]
  def change
    add_column :supermarkets, :image, :string
  end
end
