class Sound < ActiveRecord::Base
  attachment :audio
  belongs_to :user

  validates :name, :audio, :user_id, presence: true
  validates :audio_id, uniqueness: true


end
