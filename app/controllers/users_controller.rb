class UsersController < ApplicationController

   def login
puts 1111
     usrs = User.all
     usrs.each do |u|
        puts u.id
        puts u.user_name
        puts u.email
        puts u.password
        puts "-----"
        # u.destroy
    end
      render :action => "login", :layout => false
    end

    def signup
      @user = User.new
    end

    def register_user
        @user = User.new(user_params)
        if @user.valid?
          @user.encryptPass(@user.password)
          @user.encryptPassonfirm(@user.password_confirmation)
          @user.save
          redirect_to :action => 'login'
        else
          @user.password = ""
          @user.email = ""
          # @errorMsg = @user.errors.first[1] unless @user.errors.full_messages[0].nil?
          render :action => "signup"
        end
    end

    def signin
      if params[:user_name] !="" && params[:password]!=""
        @user = User.authenticate(params[:user_name], params[:password])
        if @user
           session[:user] = @user
           redirect_to :action => "wishlist",id: @user.id
        else
           flash[:error] = "Invalid User Name or Password."
           redirect_to :controller => "users", :action => "login"
         end
      else
         flash[:error] = "Invalid User Name or Password."
        redirect_to :controller => "users", :action => "login"
      end
    end

    def wishlist
      @user_id = params[:id]
      @wishlist = Wish.order("created_at DESC")
    end

    def save_wish
      new_wish = Wish.new
      new_wish.wish = params[:comment]
      new_wish.user_id = params[:user_id]
      new_wish.save
      @wishlist = Wish.order("created_at DESC")
      render :layout =>false
    end

    def signout
      session[:user] = nil
      redirect_to :action => "login"
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        @user.save
        redirect_to :action => "wishlist",id: @user.id
      else
        flash[:error] = "Error occurs,profile has not updated."
        render :action => "edit"
      end
    end


end
