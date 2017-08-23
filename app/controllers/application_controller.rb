class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_order

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def current_order
    if session[:order_id]
      @current_order = Order.find(session[:order_id])
    elsif @current_user.orders.last.complete === false
      @current_order = @current_user.orders.last
    else
      @current_order = @current_user.orders.create
      session[:order_id] = @current_order.id
      @current_order
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end
end
