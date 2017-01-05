class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "shyam", password: "shyam"
  def index
  	@students = Student.all
  end
  
end
