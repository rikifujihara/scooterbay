class RemoveSoldFromListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :sold, :boolean
  end
end
