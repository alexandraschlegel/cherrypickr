class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :supermarkets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
