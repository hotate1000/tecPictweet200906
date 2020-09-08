class Tweet < ApplicationRecord
  # validates :text,:image,:name, presence: true
  validates :text,:image, presence: true

  belongs_to :user
  has_many   :comments

  # def self.search(search)
  #   return Tweet.all unless search
  #   Tweet.where('text LINK(?)', "%#{search}%")
  # end
  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
