class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, dependent: :destroy
  validates :picture, content: [:png, :jpg, :jpeg]
end
