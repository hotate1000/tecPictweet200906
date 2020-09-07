class Tweet < ApplicationRecord
  # validates :text,:image,:name, presence: true
  validates :text,:image, presence: true

  belongs_to :user
end
