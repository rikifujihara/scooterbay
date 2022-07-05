class Address < ApplicationRecord
  belongs_to :listing
  validates :postcode, allow_nil: true, length: { is: 4 }
end