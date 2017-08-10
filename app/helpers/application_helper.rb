module ApplicationHelper
  def check_user
    session[:user_id] === current_user.id ? true : false
  end
end
