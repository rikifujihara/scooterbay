class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :offerer, null: false, foreign_key: { to_table: :users }
      t.references :merchant, null: false, foreign_key: { to_table: :users }
      t.integer :price, null: false

      t.timestamps
    end
  end
end
