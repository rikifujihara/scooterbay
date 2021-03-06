class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  validates :avatar, content_type: [:png, :jpg, :jpeg]
  validates :first_name, presence: true, format: {with: /[a-zA-Z]/, message: "Only alphabetical characters allowed for first name"}

  has_many :listings, dependent: :destroy
  has_many :watched_items, dependent: :destroy

  has_many :offers_in, foreign_key: "merchant_id", class_name: "Offer", dependent: :destroy
  has_many :offers_out, foreign_key: "offerer_id", class_name: "Offer", dependent: :destroy

end