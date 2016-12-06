class StudentsController < ApplicationController
	  def new
		  @student= Student.new
  	end
  	def index
      @students = Student.all
    end
  	def show
    	@student = Student.find(params[:id])
  	end
    def edit
      @student = Student.find(params[:id])
    end

  	def create
  		@student = Student.new(student_params)
  		#@student.save
  		#redirect_to @student
      if @student.save
        redirect_to @student
      else
        render 'new'
      end
  	end
    def update
      @student = Student.find(params[:id])
   
      if @student.update(student_params)
        redirect_to @student
      else
        render 'edit'
      end
    end
    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to welcome_index_path
    end
  	private
  		def student_params
  			params.require(:student).permit(:first_name,:last_name,:email_id,:mob_number,:con_mob_number)
  		end
end
