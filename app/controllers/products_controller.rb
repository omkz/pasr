class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.includes(image_attachment: :blob).where("user_id = ?", current_user.id)
  end

  def new
    if current_user.is_vendor?
      @product = Product.new
    else
      redirect_to new_vendor_path, notice: 'Create vendor first.'
    end
  end

  def edit
  end

  def create
    @product = Product.new(product_params) do |product|
      product.user = current_user
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :product_category_id, :user_id)
  end

end
