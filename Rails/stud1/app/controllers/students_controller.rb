  require "prawn"
class StudentsController < ApplicationController
include ActionController::Live

  #def stream
  #  response.headers['Content-Type'] = 'text/event-stream'
  #  100.times {
  #   response.stream.write "hello world\n"
  #    sleep 1
  #  }
  #ensure
  #  response.stream.close
  #end

  def download_pdf
    
    student = Student.find(params[:student_id])
    send_data generate_pdf(student),:disposition => 'inline',
              filename: "#{student.first_name}.pdf",
              type: "application/pdf"
  end 
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
    if @student.save

      redirect_to @student
    else
      render 'new'
      #render plain: "ok"
      #render inline: "<%= student.each do |p| %><p><%= p.name %></p><% end %>"
      #render html: "<strong>Not Found</strong>".html_safe
      #render json: @student
      #render xml: @student
      #render js: "alert('Hello Rails');"
      #render body: "raw"
      #ender xml: photo, location: /home/webwerks/Desktop/340th-anniversary-of-the-determination-of-the-speed-of-light-5651280530767872.2-scta.png
      #render templete: "students/show"

      #render status: 200
      #render status: :forbidden
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
      params.require(:student).permit(:first_name,:last_name,:email_id,:password,:password_confirmation,:picture)
    end

    def generate_pdf(student)
      Prawn::Document.new do
        text student.first_name, align: :center
        
        text "First Name: #{student.first_name}"
        text "Last name: #{student.last_name}"
        text "Email: #{student.email_id}"
      end.render
    end

end
