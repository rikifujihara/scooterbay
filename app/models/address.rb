class Address < ApplicationRecord
  belongs_to :listing
  # validates :postcode, length: { maximum: 4, minimum: 4 }
end