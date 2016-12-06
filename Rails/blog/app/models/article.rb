class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  #validates :title, :text, presence: true

  # validates :title, exclusion: { in: %w(title),
  #  message: "%{value} is reserved." }
  #  validates :title, length: { maximum: 500 }
  # validates :title, length: { in: 5..15 }
  #  validates :title, format: { with: /\A[a-zA-Z]+\z/,
  #  message: "only allows letters" }
  #  #validates :title, presence: { strict: true }
  # validates :title, :text, presence: true
  #  validates :title, uniqueness: true
   #before_validation :ensure_title_has_a_value
    #def ensure_title_has_a_value

    #  if title.empty?
    #    self.title = text unless text.blank?
        #binding.pry
    #  end
   # end
   #before_create do
   #	self.title = text.capitalize if title.blank?
   #end
   after_initialize do |user|
   		puts "object initialized"
   	end
   before_validation :normalize_name, on: :create
   protected
   		def normalize_name
   			self.title = self.text.downcase.titleize
   		end
end
