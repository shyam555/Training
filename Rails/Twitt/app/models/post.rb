class Post < ActiveRecord::Base
  #associations
  has_many :comments, dependent: :destroy
  has_many :retweets, class_name: "Post", foreign_key: "retweet_id", dependent: :destroy
  belongs_to :user
  # attributes
  # validations
  validates :content, presence: true, length: { maximum: 140 }
  # scopes
  default_scope -> { order(created_at: :desc) }
  # callbacks
  # methods
  mount_uploader :picture, PictureUploader
end
