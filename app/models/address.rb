class Address < ApplicationRecord
  belongs_to :listing
  validates :postcode, allow_nil: true, length: { is: 4 }
  validates :state, allow_nil: true, length: { minimum: 2, maximum: 3 }, format: {with: /[A-Z]/, message: ": Please use capital letters (eg. VIC)"}
  validates :suburb, allow_nil: true, format: {with: /[a-zA-Z]/, message: ": Letters only please"}
  validates :street_name, allow_nil: true, format: {with: /[a-zA-Z]/, message: ": Letters only please"}
  validates :street_number, allow_nil: true, numericality: true
end