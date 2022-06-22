class AddPriceToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :price, :integer
  end
end
