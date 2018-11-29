module ApplicationHelper
  def logged_user
    return session[:user] if session[:user]
  end
end
