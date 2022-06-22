class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :offerer
  belongs_to :merchant
end
