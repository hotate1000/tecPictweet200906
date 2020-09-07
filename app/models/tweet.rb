class Tweet < ApplicationRecord
  validates :text,:image,:name, presence: true

  belongs_to :user
end
