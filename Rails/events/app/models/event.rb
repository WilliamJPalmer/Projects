class Event < ActiveRecord::Base
  belongs_to :user
  # has_many :users
  has_many :participates
  has_many :comments
  has_many :user_comments, through: :comments, source: :user
  has_many :users_attending, through: :participates, source: :user


  validates :name, presence: true, length: { minimum: 2 }
  validates :location, presence: true, length: { minimum: 2 }
  validates :state, presence: true
  validates :date, presence: true
end
