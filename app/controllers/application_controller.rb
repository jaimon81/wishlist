class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user , :except =>[ :login, :signin, :signup,:register_user]

  def authenticate_user
    unless logged_user
      redirect_to :controller => "users", :action => "login"
    end
  end

  def logged_user
    return session[:user] if session[:user]
  end


  def user_params
    params.require(:user).permit(:name,:user_name,:password,:password_confirmation, :email, :age, :address, :prof_pic)
  end

  def wish_params
    params.require(:wish).permit(:wish)
  end

end
