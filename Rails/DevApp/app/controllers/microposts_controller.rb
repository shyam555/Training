class MicropostsController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @microposts = @member.microposts.paginate(page: params[:page])
  end
end
