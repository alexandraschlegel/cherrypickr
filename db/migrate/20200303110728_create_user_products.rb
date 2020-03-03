class CreateUserProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_products do |t|
      t.references :users, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
