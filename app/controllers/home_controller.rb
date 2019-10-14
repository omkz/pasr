class HomeController < ApplicationController
  
  def index
    if params[:search]
      @products = Product.includes(image_attachment: :blob).search(params[:search]).order("created_at DESC")
    else
      @products = Product.includes(image_attachment: :blob).order("created_at DESC")
    end
  end
end
