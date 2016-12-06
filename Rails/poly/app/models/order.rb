class Order < ActiveRecord::Base
	belongs_to :user
	has_one :contact, as: :contactable
end
