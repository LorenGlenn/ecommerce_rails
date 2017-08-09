class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:id])
    @product.stock -= 1
    @order_item = Product.order_items.new(params[:quanitity], @product.id, current_order.id)
  end
end
