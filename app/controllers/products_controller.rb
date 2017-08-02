class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You successfully created a product!"
      session[:product_id] = @product.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem saving this product."
      redirect_to '/product/new'
    end
  end

  private

  def user_params
    params.require(:product).permit(:name, :cost, :description, :image)
  end
end
