class WelcomeController < ApplicationController
	def index
		@student = Student.all
	end
	def new

	end
	def create
		@student = Student.new(student_params)
 
  		@student.save
  		redirect_to @student

	end
	def show
		@student = Student.all
	end
end
