class HomeController < ApplicationController
  
  def index
    if params[:search]
      @products = Product.search(params[:search])
    else
      @products = Product.includes(image_attachment: :blob).order("created_at DESC")
    end
  end
end
