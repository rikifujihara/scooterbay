class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :offerer, foreign_key: "offerer_id", class_name: "User"
  belongs_to :merchant, foreign_key: "merchant_id", class_name: "User"
  validates :price, allow_nil: true, numericality: true
end