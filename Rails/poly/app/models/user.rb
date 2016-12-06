class User < ActiveRecord::Base
	has_many :orders, -> { limit(100) }
	has_one :contact, as: :contactable
end
