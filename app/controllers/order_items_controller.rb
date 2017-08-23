class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:order_item][:product_id])
    @order = current_order
    @product.stock -= Integer(item_params[:quantity])
    @order_item = @order.order_items.create(item_params)
    @order.total += @product.cost * @order_item.quantity
    if @order.save
      @product.save
      flash[:notice] = "Item added to cart!"
      redirect_to products_path
    else
      flash[:notice] = "Item can't be added!"
      redirect_to products_path
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order = current_order
    @product = Product.find(@order_item.product_id)
    @product.order_items.delete(@order_item)
    @order.order_items.delete(@order_item)
    @order.total -= @order_item.quantity * @product.cost
    @order.save
    @product.stock += @order_item.quantity
    if @order_item.destroy
      flash[:alert] = "Item removed from cart!"
      redirect_to "/cart"
    else
      flash[:alert] = "An error occurred, item not removed from cart!"
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
