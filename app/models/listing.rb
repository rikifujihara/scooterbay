class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, dependent: :destroy
  validates :picture, content_type: [:png, :jpg, :jpeg]
  has_many :orders, dependent: :destroy
  has_many :offers, dependent: :destroy
end
