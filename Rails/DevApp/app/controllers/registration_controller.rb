class RegistrationController < Devise::RegistrationsController
  def index
    @member = Member.all
  end
  def new
    @member= Member.new
  end


  def create

    @member = Member.new
    @member.username = params[:member][:username]
    @member.name = params[:member][:name]
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation = params[:member][:password_confirmation]
    @member.valid?
    if @member.errors.blank?

    @member.save
    redirect_to dashboard_path
    else
    render :action => "new"
    end
  end

  def show
      @member = Member.find(params[:id])
      @microposts = @member.microposts.paginate(page: params[:page])
  end
end