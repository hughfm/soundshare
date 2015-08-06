class Sound < ActiveRecord::Base
  attachment :audio
  belongs_to :user

  validates :audio, :user_id, presence: true
  validates :audio_id, uniqueness: true

  def title
    return name unless name.blank?
    "Sound from #{ created_at.strftime "%A, %B %d" }"
  end

end
