class Address < ApplicationRecord
  belongs_to :listing
  validates :postcode, allow_nil: true, length: { is: 4 }
  validates :state, allow_nil: true, length: { is: 3 }, format: {with: /[A-Z]/, message: ": Please use capital letters (eg. VIC)"}
end