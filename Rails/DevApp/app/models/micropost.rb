class Micropost < ActiveRecord::Base
  belongs_to :member
  default_scope -> { order(created_at: :desc) }
  validates :member_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
