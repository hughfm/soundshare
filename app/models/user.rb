class User < ActiveRecord::Base
  has_secure_password
  has_many :sounds, dependent: :destroy
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def name
    "#{first_name} #{last_name}"
  end
end
