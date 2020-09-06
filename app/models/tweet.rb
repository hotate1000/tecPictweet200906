class Tweet < ApplicationRecord
  validates :text,:image,:name, presence: true
end
