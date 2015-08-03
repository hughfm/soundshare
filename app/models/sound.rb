class Sound < ActiveRecord::Base
  attachment :audio
  validates :name, :audio, presence: true


end
