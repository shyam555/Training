class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @categories = Category.all
    @category = Category.find(21)
  end
end
