class Student < ActiveRecord::Base
	validates :first_name, :last_name, :email_id, presence: true
                    #length: { minimum: 5 }
    validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    validates :mob_number,:presence => true, :confirmation=>true
    validates_confirmation_of :mob_number_confirmation
    #validates :mob_number, :con_mob_number, numericality: true

    validates :email_id, uniqueness: true

end
