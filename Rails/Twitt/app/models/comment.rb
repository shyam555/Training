class Comment < ActiveRecord::Base
  #associations
  belongs_to :post
  belongs_to :user
  # attributes
  # validations
  validates :content, presence: true
  # scopes
  default_scope -> { order(created_at: :desc) }
  # callbacks
  # methods
end