class Student < ActiveRecord::Base
  validates :first_name, :last_name, :email_id, presence: true
                  #length: { minimum: 5 }
  mount_uploader :picture, PictureUploader
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }

  validates :email_id, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
  message: "please enter in 'abc@xyz.com' format" }

  validates :email_id, uniqueness: true
  validates :password, confirmation: true, presence:true, uniqueness: true
  validates :password_confirmation, presence:true
end
