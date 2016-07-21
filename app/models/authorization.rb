class Authorization < ActiveRecord::Base
  belongs_to :user
  belongs_to :sound

  validates :sound, uniqueness: { scope: :user, message: "can only be authorized once per user." }

  delegate :full_name, to: :user
end
