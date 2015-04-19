class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_url
    else 
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation)
  end

end
