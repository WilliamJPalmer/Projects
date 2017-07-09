class Product < ActiveRecord::Base
  belongs_to :user
  has_many :purchases
  has_many :sells
  has_many :users_buy, through: :purchase, source: :user
  has_many :users_sell, through: :sell, source: :user

  validates :name, presence: true, length: { minimum: 2 }
  validates :price, presence: true
end
