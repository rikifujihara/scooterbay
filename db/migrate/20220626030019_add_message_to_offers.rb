class AddMessageToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :message, :text
  end
end
