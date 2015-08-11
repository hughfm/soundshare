class Sound < ActiveRecord::Base
  attachment :audio, extension: ["mp3", "mp4", "m4a", "aif", "wav"]
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :authorizations, dependent: :destroy
  has_many :authorized_users, through: :authorizations, source: :user

  validates :audio, :owner, presence: true
  validates :audio_id, uniqueness: true

  scope :public_share, -> { where(public: true).order(created_at: :desc) }

  self.per_page = 10

  def title
    return name unless name.blank?
    "Sound from #{ created_at.strftime "%A, %B %d" }"
  end

  def owner?(user)
    owner == user
  end
end
