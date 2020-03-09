class CreateBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.string :address
      t.string :longitude
      t.string :latitude
      t.references :supermarket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
