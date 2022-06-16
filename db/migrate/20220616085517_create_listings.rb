class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :brand
      t.integer :price
      t.text :description
      t.boolean :sold, default: false
      t.boolean :in_built_lighting, default: false
      t.boolean :double_motor, default: false
      t.boolean :pneumatic_tires, default: false
      t.boolean :has_suspension, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
