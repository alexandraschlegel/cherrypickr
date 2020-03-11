class CreateBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :branches do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :supermarket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
