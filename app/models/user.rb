class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  validates :avatar, content_type: [:png, :jpg, :jpeg]

  has_many :listings, dependent: :destroy
  has_many :watched_items, dependent: :destroy

  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order", dependent: :destroy
  has_many :bought_orders, foreign_key: "buyer_id", class_name: "Order", dependent: :destroy
  has_many :offers_in, foreign_key: "merchant_id", class_name: "Offer", dependent: :destroy
  has_many :offers_out, foreign_key: "offerer_id", class_name: "Offer", dependent: :destroy

end