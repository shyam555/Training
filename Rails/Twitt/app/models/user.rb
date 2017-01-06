class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id",dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  #attributes
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "80x80" }
  #validations
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name,:avatar,:email, presence: true
  # scopes
  # callbacks
  # methods
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a user
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end
end



