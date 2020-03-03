class AddFieldsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :name, :string
    add_column :products, :price_cents, :integer
    add_column :products, :weight, :float
    add_column :products, :description, :string
  end
end
