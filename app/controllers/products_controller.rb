class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    # @products = Product.includes(image_attachment: :blob).where("vendor_id = ?", current_user.vendor)
    @products = current_user.vendor.products.includes(image_attachment: :blob)
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
      product.vendor = current_user.vendor
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

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :product_category_id, :vendor_id)
  end

end
