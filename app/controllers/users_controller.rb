class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @top_instrument = Instrument.most_routines.first
    @routine_count = @user.routine_count

    if @user && @user == current_user
      render :show
    else
      redirect_to user_path(current_user)
    end
  end
end

private

def user_params
  params.require(:user).permit(:username, :password)
end
