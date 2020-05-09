class SessionsController < ApplicationController 
  before_action :check_if_logged_in, except:[:destroy]
  before_action :authenticate_user, only:[:destroy]

  def new 
    @user = User.new
  end

  def create 
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password_hash]
      session[:user_id] = @user.id
      redirect_to @user
    else
      @message = 'Username or Password Incorrect'
      redirect_to '/login'
    end
  end
  
  def destroy 
    reset_session
    redirect_to '/login'
  end 

  private

  def check_if_logged_in
    redirect_to users_path if logged_in?
  end
end