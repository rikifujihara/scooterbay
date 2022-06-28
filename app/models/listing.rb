class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :address, dependent: :destroy
  has_one_attached :picture, dependent: :destroy
  validates :picture, content_type: [:png, :jpg, :jpeg]
  has_many :offers, dependent: :destroy
  has_many :watched_items, dependent: :destroy
end