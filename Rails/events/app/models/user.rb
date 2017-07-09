class User < ActiveRecord::Base

  has_many :events
  has_many :comments
  has_many :participates
  has_many :attending, through: :participate, source: :events
  has_many :event_comments, through: :comments, source: :events
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name,  presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: {case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :location,  presence: true, length: { minimum: 5 }
  validates :state, presence: true
  validates :password, presence: true, length: { minimum: 6 }, :on => :create


  before_save :email_lowercase

  def email_lowercase
    email.downcase
  end
end
