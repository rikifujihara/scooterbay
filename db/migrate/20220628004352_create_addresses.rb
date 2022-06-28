class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :listing, null: false, foreign_key: true
    t.string :state
      t.integer :postcode
      t.string :suburb
      t.string :street_name
      t.integer :street_number

      t.timestamps
    end
  end
end
