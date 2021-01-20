class SessionsController < ApplicationController
  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def omniauth
    @user = User.create_user_with_google(auth)

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
