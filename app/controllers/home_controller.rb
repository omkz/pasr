class HomeController < ApplicationController
  
  def index
    if params[:search]
      @products = Product.search(params[:search])
    else
      @products = Product.with_attached_image.order("created_at DESC")
    end
  end
end
