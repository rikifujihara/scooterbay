class RemovePriceFromOffers < ActiveRecord::Migration[6.1]
  def change
    remove_column :offers, :price, :integer
  end
end
