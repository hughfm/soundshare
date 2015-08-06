class Sound < ActiveRecord::Base
  attachment :audio
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :authorizations, dependent: :destroy
  has_many :authorized_users, through: :authorizations, source: :user

  validates :audio, :user_id, presence: true
  validates :audio_id, uniqueness: true

  scope :public_share, -> { where(public: true) }

  def title
    return name unless name.blank?
    "Sound from #{ created_at.strftime "%A, %B %d" }"
  end

  def owner?(user)
    owner == user
  end
end
