class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #validates :status, presence: true
  has_many :cart_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
